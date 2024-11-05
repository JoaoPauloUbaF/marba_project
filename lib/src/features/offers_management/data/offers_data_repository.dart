import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

abstract class OffersDataRepository {
  Stream<List<OfferModel>> getOffers({OfferModel? lastOffer});
  Future<List<OfferModel>> getOffersAt(
      {OfferModel? lastOffer, required String city});
  Stream<List<OfferModel>> getOffersByBusinessId(String businessId,
      {OfferModel? lastOffer});
  Future<OfferModel> getOffer(String id);
  Future<DocumentSnapshot?> createOffer(OfferModel offer);
  Future<void> updateOffer(OfferModel offer);
  Future<void> updateOfferAvailableQuantity(
      {required String offerId, required int newQuantity});
  Future<void> deleteOffer(String id);
  Future<void> deleteBusinessOffers({required String businessId});
  Future<String?> saveOfferImage(File image, String offerId,
      {bool isMedia = false});
  Future<List<String>> saveOfferMedia(
    List<File?> offerMedia,
    String offerId,
  );

  // Updated method signatures
  Future<List<OfferModel>> queryOffers(
      {required String queryStr, required String city});
  Query queryOffersByTitle(String queryStr, String city);
  Query queryOffersByCategory(String queryStr, String city);
  Query queryOffersByBusinessName(String queryStr, String city);
  Query queryOffersByBusinessCategory(String queryStr, String city);
  Query queryOffersByDescription(String queryStr, String city);
}
