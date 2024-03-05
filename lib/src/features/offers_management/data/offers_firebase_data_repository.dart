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
    final documentReference =
        await _firestore.collection('offers').add(offer.toJson());
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
    await _firestore.collection('offers').doc(id).delete();
  }

  @override
  Stream<List<OfferModel>> getOffersByBusinessId(String businessId) {
    return _firestore
        .collection('offers')
        .where('businessId', isEqualTo: businessId)
        .snapshots()
        .map((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        return <OfferModel>[];
      }
      return querySnapshot.docs
          .map((doc) => OfferModel.fromJson(doc.data()))
          .toList();
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
