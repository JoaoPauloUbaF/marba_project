import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

abstract class OffersDataRepository {
  Stream<List<OfferModel>> getOffers({OfferModel? lastOffer});
  Stream<List<OfferModel>> getOffersByBusinessId(String businessId,
      {OfferModel? lastOffer});
  Future<OfferModel> getOffer(String id);
  Future<DocumentSnapshot?> createOffer(OfferModel offer);
  Future<void> addOffer(OfferModel offer);
  Future<void> updateOffer(OfferModel offer);
  Future<void> deleteOffer(String id);
  Future<void> deleteBusinessOffers({required String businessId});
  Future<String?> saveOfferImage(File image, String offerId,
      {bool isMedia = false});
  Future<List<String>> saveOfferMedia(
    List<File?> offerMedia,
    String offerId,
  );
}
