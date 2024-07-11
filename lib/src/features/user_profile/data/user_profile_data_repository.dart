import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/user/user_model.dart';

import '../../../core/models/address/address.dart';

abstract class ProfileDataRepository {
  Future<DocumentSnapshot?> createProfile({
    required String uid,
    required String phoneNumber,
  });

  Future<void> updateProfile({
    required UserModel user,
  });

  Future<void> deleteProfile({required String uid});

  Stream<UserModel?> getProfileData({required String uid});

  Future<List<String?>> getOwnedBusinessIds({required String uid});

  Future<void> addOwnedBusinessId(
      {required String uid, required String businessId});

  Future<void> removeOwnedBusinessId(
      {required String uid, required String businessId});

  Future<void> addOrUpdateDeliveryAddress(
      {required String uid, required Map<String, dynamic> address});

  Stream<List<AddressModel>> getDeliveryAddresses({required String uid});

  Future<void> addQueryToSearchHistory(
      {required String uid, required String query});

  Future<List<String>> getSearchHistory({required String uid});

  Future<void> clearSearchHistory({required String uid});

  Future<void> addFavoriteOfferId(
      {required String uid, required String offerId});

  Future<void> removeFavoriteOfferId(
      {required String uid, required String offerId});

  Future<Set<String>> getFavoriteOfferIds({required String uid});

  FutureOr<void> deleteDeliveryAddress(
      {required String uid, required AddressModel address}) {}
}
