import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_marba/src/core/models/product/enums.dart';
import 'package:project_marba/src/core/models/service/enums.dart';
import 'package:project_marba/src/core/utils/translations_utils.dart';

import '../../../core/models/offer/offer_model.dart';
import '../../../core/models/review/review_model.dart';
import 'offers_data_repository.dart';

class OffersFirebaseDataRepository implements OffersDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<OfferModel>> getOffers({OfferModel? lastOffer}) async* {
    Query query = _firestore
        .collection('offers')
        .orderBy(
          'createdAt',
          descending: true,
        )
        // Assuming there's a field 'createdAt' to order by
        .limit(10);

    if (lastOffer != null) {
      query = query.startAfterDocument(
          await _firestore.collection('offers').doc(lastOffer.id).get());
    }

    yield* query.snapshots().map((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        return <OfferModel>[];
      }
      final result = querySnapshot.docs
          .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return result;
    });
  }

  @override
  Future<OfferModel> getOffer(String id) async {
    final documentSnapshot =
        await _firestore.collection('offers').doc(id).get();
    final offer = OfferModel.fromJson(documentSnapshot.data()!);
    return offer;
  }

  @override
  Future<DocumentSnapshot?> createOffer(OfferModel offer) async {
    var docId = offer.id;
    await _firestore.collection('offers').doc(docId).set(offer.toJson());
    final documentReference = _firestore.collection('offers').doc(docId);
    final documentSnapshot = await documentReference.get();
    return documentSnapshot;
  }

  @override
  Future<void> updateOffer(OfferModel offer) async {
    await _firestore.collection('offers').doc(offer.id).update(offer.toJson());
  }

  @override
  Future<void> deleteOffer(String id) async {
    try {
      log('Deleting offer: $id');
      await _firestore.collection('offers').doc(id).delete();
      await FirebaseStorage.instance
          .ref()
          .child('offer_images')
          .child(id)
          .listAll()
          .then(
            (value) async => {
              for (var item in value.items) await item.delete(),
            },
          );
    } catch (e) {
      log('Error deleting offer: $e');
    }
  }

  @override
  Stream<List<OfferModel>> getOffersByBusinessId(String businessId,
      {OfferModel? lastOffer}) async* {
    Query query = _firestore
        .collection('offers')
        .where('businessId', isEqualTo: businessId)
        .orderBy(
          'createdAt',
          descending: true,
        )
        .limit(10);

    if (lastOffer != null) {
      query = query.startAfterDocument(
          await _firestore.collection('offers').doc(lastOffer.id).get());
    }

    yield* query.snapshots().map((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        return <OfferModel>[];
      }
      final result = querySnapshot.docs
          .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return result;
    });
  }

  @override
  Future<String?> saveOfferImage(File image, String offerId,
      {bool isMedia = false}) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('offer_images').child(offerId);
      final imageName =
          isMedia ? 'offer_media_$offerId.jpg' : 'offer_picture_$offerId.jpg';
      final uploadTask = storageRef.child(imageName).putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  @override
  Future<List<String>> saveOfferMedia(
      List<File?> offerMedia, String offerId) async {
    List<String> offerMediaUrls = [];
    for (var element in offerMedia) {
      final elementName = offerId + offerMedia.indexOf(element).toString();
      if (element != null) {
        final imageUrl =
            await saveOfferImage(element, elementName, isMedia: true);
        if (imageUrl != null) {
          offerMediaUrls.add(imageUrl);
        }
      }
    }
    return offerMediaUrls;
  }

  @override
  Future<void> deleteBusinessOffers({required String businessId}) {
    return _firestore
        .collection('offers')
        .where('businessId', isEqualTo: businessId)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
      final storageRef = FirebaseStorage.instance.ref().child('offer_images');
      return storageRef.listAll().then((value) {
        for (var item in value.items) {
          if (item.name.contains(businessId)) {
            item.delete();
          }
        }
      });
    });
  }

  @override
  Future<void> updateOfferAvailableQuantity(
      {required String offerId, required int newQuantity}) async {
    final offerAvailableQuantity = await getOffer(offerId);
    if (offerAvailableQuantity.availableQuantity == newQuantity) {
      return;
    }
    return _firestore.collection('offers').doc(offerId).update({
      'availableQuantity': newQuantity,
    });
  }

  @override
  fetchReviews(
      {required String offerId,
      required int limit,
      String? lastReviewId}) async {
    Query query = _firestore
        .collection('offers')
        .doc(offerId)
        .collection('reviews')
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (lastReviewId != null) {
      final DocumentSnapshot lastReviewSnapshot = await _firestore
          .collection('offers')
          .doc(offerId)
          .collection('reviews')
          .doc(lastReviewId)
          .get();
      query = query.startAfterDocument(lastReviewSnapshot);
    }

    final querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) => ReviewModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Modified query methods
  @override
  Query queryOffersByTitle(String queryStr, String city) {
    final queryArray = queryStr.toLowerCase().split(' ');
    Query query =
        _firestore.collection('offers').where('city', isEqualTo: city).where(
              'titleWords',
              arrayContainsAny: queryArray,
            );
    return query;
  }

  @override
  Query queryOffersByBusinessCategory(String queryStr, String city) {
    Query query = _firestore
        .collection('offers')
        .where('city', isEqualTo: city)
        .where('businessCategory', isEqualTo: queryStr);
    return query;
  }

  @override
  Query queryOffersByBusinessName(String queryStr, String city) {
    Query query = _firestore
        .collection('offers')
        .where('city', isEqualTo: city)
        .where('businessName', isEqualTo: queryStr);
    return query;
  }

  @override
  Query queryOffersByCategory(String queryStr, String city) {
    queryStr = normalizeString(str: queryStr).toLowerCase();
    final List<String> productCategoriesMatches = productCategoryTranslations
        .entries
        .where(
            (element) => normalizeString(str: element.value).contains(queryStr))
        .map((e) => e.key.toString())
        .toList();

    final List<String> servicesCategoriesMatches = serviceCategoryTranslations
        .entries
        .where(
            (element) => normalizeString(str: element.value).contains(queryStr))
        .map((e) => e.key.toString())
        .toList();

    final matches = [...productCategoriesMatches, ...servicesCategoriesMatches];

    if (matches.isEmpty) {
      // Return a query that will yield no results
      return _firestore
          .collection('offers')
          .where('city', isEqualTo: city)
          .where('category', isEqualTo: '__nonexistent__');
    }

    // Limit to Firestore's maximum of 10 for arrayContainsAny
    final limitedMatches = matches.take(10).toList();

    Query query = _firestore
        .collection('offers')
        .where('city', isEqualTo: city)
        .where('category', arrayContainsAny: limitedMatches);

    return query;
  }

  @override
  Query queryOffersByDescription(String queryStr, String city) {
    final queryArray = queryStr.toLowerCase().split(' ');
    Query query = _firestore
        .collection('offers')
        .where('city', isEqualTo: city)
        .where('descriptionWords', arrayContainsAny: queryArray);
    return query;
  }

  @override
  Future<List<OfferModel>> queryOffers(
      {required String queryStr, required String city}) async {
    var queries = [
      queryOffersByTitle(queryStr, city),
      queryOffersByBusinessCategory(queryStr, city),
      queryOffersByBusinessName(queryStr, city),
      queryOffersByCategory(queryStr, city),
      queryOffersByDescription(queryStr, city),
    ];

    List<OfferModel> allOffers = [];

    for (var query in queries) {
      final offerList = await query.get();
      allOffers.addAll(offerList.docs
          .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList());
    }

    // Remove duplicates
    var uniqueOffers = allOffers.toSet().toList();

    return uniqueOffers;
  }

  @override
  Future<List<OfferModel>> getOffersAt(
      {OfferModel? lastOffer, required String city}) async {
    Query query = _firestore
        .collection('offers')
        .where('city', isEqualTo: city)
        .orderBy(
          'createdAt',
          descending: true,
        )
        // Assuming there's a field 'createdAt' to order by
        .limit(10);

    if (lastOffer != null) {
      query = query.startAfterDocument(
          await _firestore.collection('offers').doc(lastOffer.id).get());
    }

    final offerList = await query.get();
    return offerList.docs
        .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> writeReview(
      {required String offerId, required ReviewModel review}) async {
    final offerRef = _firestore.collection('offers').doc(offerId);
    final reviewRef = offerRef.collection('reviews').doc(review.id);
    await reviewRef.set(review.toJson());
  }

  @override
  Future<void> deleteReview(
      {required String offerId, required String reviewId}) async {
    final reviewRef = _firestore
        .collection('offers')
        .doc(offerId)
        .collection('reviews')
        .doc(reviewId);
    await reviewRef.delete().then((value) {
      log('Review deleted');
    }).catchError((error) {
      log('Error deleting review: $error');
    });
  }
}
