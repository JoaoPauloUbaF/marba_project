import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../shared/models/offer/offer_model.dart';
import 'offers_data_repository.dart';

class OffersFirebaseDataRepository implements OffersDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<OfferModel>> getOffers() async {
    final querySnapshot = await _firestore.collection('offers').get();
    if (querySnapshot.docs.isEmpty) {
      return [];
    }
    final offers = querySnapshot.docs
        .map((doc) => OfferModel.fromJson(doc.data()))
        .toList();
    return offers;
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
      await _firestore.collection('offers').doc(id).delete();
    } catch (e) {
      print('Error deleting offer: $e');
    }
  }

  @override
  Stream<List<OfferModel>> getOffersByBusinessId(String businessId,
      {OfferModel? lastOffer, int? limit}) async* {
    Query query = _firestore
        .collection('offers')
        .where('businessId', isEqualTo: businessId)
        .orderBy(
          'createdAt',
          descending: true,
        )
        // Assuming there's a field 'createdAt' to order by
        .limit(limit!);

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
  Future<String?> saveOfferImage(File image, String offerId) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('offer_images');
      final imageName = 'offer_$offerId.jpg';
      final uploadTask = storageRef.child(imageName).putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
