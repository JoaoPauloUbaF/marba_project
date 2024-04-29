import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/user/user_model.dart';

import '../../../core/models/address/address.dart';

abstract class ProfileDataRepository {
  Future<DocumentSnapshot?> createProfile({
    required String uid,
    required String displayName,
    required String phoneNumber,
    required Map<String, dynamic> address,
    required String email,
  });

  Future<void> updateProfile({
    required String uid,
    String? displayName,
    String? phoneNumber,
    required Map<String, dynamic> address,
  });

  Future<void> deleteProfile({required String uid});

  Future<UserModel?> getProfileData({required String uid});

  Future<List<String?>> getOwnedBusinessIds({required String uid});

  Future<void> addOwnedBusinessId(
      {required String uid, required String businessId});

  Future<void> removeOwnedBusinessId(
      {required String uid, required String businessId});

  Future<void> addDeliveryAddress(
      {required String uid, required Map<String, dynamic> address});

  Stream<List<Address>> getDeliveryAddresses({required String uid});

  Future<void> addQueryToSearchHistory(
      {required String uid, required String query});

  Future<List<String>> getSearchHistory({required String uid});

  Future<void> clearSearchHistory({required String uid});
}
