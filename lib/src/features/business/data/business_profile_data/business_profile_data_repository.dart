import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/business/business.dart';

abstract class BusinessProfileDataRepository {
  Future<DocumentSnapshot?> createBusinessProfile(
      {required BusinessModel business});
  Future<void> deleteBusinessProfile({required String uid});
  Future<BusinessModel?> getBusinessProfileData({required String uid});
  Future<void> updateBusinessName(
      {required String uid, required String businessName});
  Future<void> updateBusinessEmail(
      {required String uid, required String businessEmail});
  Future<void> updateBusinessPhoneNumber(
      {required String uid, required String businessPhoneNumber});
  Future<void> updateBusinessAddress(
      {required String uid, required Map<String, dynamic> address});
  Future<void> updateBusinessStatus(
      {required String uid, required BusinessStatus status});
  Future<void> updateBusinessCategory(
      {required String uid, required Map<String, dynamic> businessCategory});
  Future<void> updateBusinessProfileImage(
      {required String uid, required File imageFile});
  Future<void> updateBusinessOffers(
      {required String uid, required Set<String> offersIds});
  Future<List<BusinessModel>?> getBusinessesAt({required String city});
  Future<double> getBusinessDeliveryFee(businessId);

  Future<void> updateBusinessDelivery(
      {required String uid, required double deliveryFee});
}
