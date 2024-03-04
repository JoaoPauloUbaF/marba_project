import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

abstract class OffersDataRepository {
  Future<List<OfferModel>> getOffers();
  Future<List<OfferModel>> getOffersByBusinessId(String businessId);
  Future<OfferModel> getOffer(String id);
  Future<DocumentSnapshot?> createOffer(OfferModel offer);
  Future<void> addOffer(OfferModel offer);
  Future<void> updateOffer(OfferModel offer);
  Future<void> deleteOffer(String id);
  Future<String?> saveOfferImage(File image, String offerId);
}
