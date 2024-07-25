import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/business/business.dart';

import '../../../../core/models/business/enums.dart';

/// Interface para o repositório de dados do perfil de negócios.
abstract class BusinessProfileDataRepository {
  /// CRUD Operations
  Future<DocumentSnapshot?> createBusinessProfile(
      {required BusinessModel business});
  Future<void> deleteBusinessProfile({required String uid});
  Future<BusinessModel?> getBusinessProfileData({required String uid});
  Future<void> updateBusinessProfile({required BusinessModel business});
  Future<void> deleteBusinessFolder({required String uid});

  /// Updates Específicos do Perfil
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
      {required String uid,
      required List<BusinessCategory> businessCategories});
  Future<void> updateBusinessProfileImage(
      {required String uid, required File imageFile});
  Future<void> updateBusinessOffers(
      {required String uid, required Set<String> offersIds});
  Future<void> updateBusinessOpeningHours(
      {required String uid, required Map<String, String> openingHours});
  Future<void> updateBusinessDelivery(
      {required String uid, required double deliveryFee});

  /// Consultas de Negócios
  Future<List<BusinessModel>?> getBusinessesAt({required String city});
  Future<List<BusinessModel>?> queryBusinessesByCategory(
      {required String city, required List<String> categories});
  Future<List<BusinessModel>?> queryBusinessesByName(
      {required String city, required String queryStr});
  Future<List<BusinessModel>?> queryBusinessAt(
      {required String city, required String queryStr});
  Future<List<BusinessModel>?> getBusinesses({required Query query});

  /// Taxa de Entrega
  Future<double> getBusinessDeliveryFee(businessId);
}
