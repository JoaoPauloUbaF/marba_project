import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_marba/src/core/models/product/enums.dart';
import 'package:project_marba/src/core/models/service/enums.dart';
import 'package:project_marba/src/core/utils/translations_utils.dart';

import '../../../core/models/offer/offer_model.dart';
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
  Future<void> addOffer(OfferModel offer) async {
    await _firestore.collection('offers').doc(offer.id).set(offer.toJson());
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
  Future<List<OfferModel>>? queryOffersByTitle(String queryStr) async {
    final queryArray = queryStr.toLowerCase().split(' ');
    Query query = _firestore.collection('offers').where(
          'titleWords',
          arrayContainsAny: queryArray,
        );

    final offerList = await query.get();
    return offerList.docs
        .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OfferModel>>? queryOffersByBusinessCategory(
      String queryStr) async {
    Query query = _firestore
        .collection('offers')
        .where('businessCategory', isEqualTo: queryStr);

    final offerList = await query.get();
    return offerList.docs
        .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OfferModel>>? queryOffersByBusinessName(String queryStr) async {
    Query query = _firestore
        .collection('offers')
        .where('businessName', isEqualTo: queryStr);

    final offerList = await query.get();
    return offerList.docs
        .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OfferModel>>? queryOffersByCategory(String queryStr) async {
    //TODO: offers must have address too
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
    if (matches.isEmpty) return Future(() => <OfferModel>[]);

    Query query = _firestore
        .collection('offers')
        .where('category', arrayContainsAny: matches);

    final offerList = await query.get();
    return offerList.docs
        .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OfferModel>>? queryOffersByDescription(String queryStr) async {
    Query query = _firestore.collection('offers').where('descriptionWords',
        arrayContainsAny: queryStr.toLowerCase().split(' '));

    final offerList = await query.get();
    return offerList.docs
        .map((doc) => OfferModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OfferModel>>? queryOffers({required String queryStr}) async {
    // Call all the query methods
    var offersByTitle = await queryOffersByTitle(queryStr);
    var offersByBusinessCategory =
        await queryOffersByBusinessCategory(queryStr);
    var offersByBusinessName = await queryOffersByBusinessName(queryStr);
    var offersByCategory = await queryOffersByCategory(queryStr);
    var offersByDescription = await queryOffersByDescription(queryStr);

    // Combine all the results into one list
    var allOffers = <OfferModel>[];
    if (offersByTitle != null && offersByTitle.isNotEmpty) {
      allOffers.addAll(offersByTitle);
    }
    if (offersByBusinessCategory != null &&
        offersByBusinessCategory.isNotEmpty) {
      allOffers.addAll(offersByBusinessCategory);
    }
    if (offersByBusinessName != null && offersByBusinessName.isNotEmpty) {
      allOffers.addAll(offersByBusinessName);
    }
    if (offersByCategory != null && offersByCategory.isNotEmpty) {
      allOffers.addAll(offersByCategory);
    }
    if (offersByDescription != null && offersByDescription.isNotEmpty) {
      allOffers.addAll(offersByDescription);
    }

    // Remove duplicates from the list
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
          //TODO: add the city
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
}
