import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared/models/offer/offerModel.dart';
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
  Future<List<OfferModel>> getOffersByBusinessId(String businessId) async {
    final querySnapshot = await _firestore
        .collection('offers')
        .where('businessId', isEqualTo: businessId)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return [];
    }
    final offers = querySnapshot.docs
        .map((doc) => OfferModel.fromJson(doc.data()))
        .toList();
    return offers;
  }
}