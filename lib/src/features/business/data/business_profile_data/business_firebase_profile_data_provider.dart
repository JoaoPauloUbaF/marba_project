import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/models/business/enums.dart';
import 'business_profile_data_repository.dart';

final firestoreBusinessProfileDataProvider =
    Provider<BusinessProfileDataRepository>((ref) {
  return BusinessFirebaseProfileDataProvider();
});

class BusinessFirebaseProfileDataProvider
    implements BusinessProfileDataRepository {
  final CollectionReference _businessCollection =
      FirebaseFirestore.instance.collection('businesses');

  @override
  Future<DocumentSnapshot?> createBusinessProfile({
    required BusinessModel business,
  }) async {
    await _businessCollection.doc(business.id).set({
      'businessName': business.name,
      'businessEmail': business.email,
      'businessPhoneNumber': business.phoneNumber,
      'address': business.address.toJson(),
      'status': business.status.name.toString(),
      'businessCategory': business.categories.map((e) => e.name).toList(),
      'offersIds': business.offersIds.toList().asMap(),
    });
    return await _businessCollection.doc(business.id).get();
  }

  @override
  getBusinessesAt({required String city}) async {
    QuerySnapshot querySnapshot =
        await _businessCollection.where('address.city', isEqualTo: city).get();
    if (querySnapshot.docs.isEmpty) {
      return null;
    }
    final businesses = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final categories = (data['businessCategory'] as List<dynamic>)
          .map((e) {
            return BusinessCategory.values.firstWhere(
              (element) => element.toString().split('.').last == e,
              orElse: () => BusinessCategory
                  .other, // Handle case when enum value is not found
            );
          })
          .where((element) => true)
          .toSet();

      final offersIds = (data['offersIds'] as Map<String, dynamic>)
          .values
          .toSet()
          .cast<String>();

      return BusinessModel(
        id: doc.id,
        name: data['businessName'],
        email: data['businessEmail'],
        phoneNumber: data['businessPhoneNumber'],
        address: Address.fromJson(data['address']),
        status: BusinessStatus.values.firstWhere(
          (e) => e.toString().split('.').last == data['status'],
        ),
        categories: categories.toSet(),
        offersIds: offersIds,
        imageUrl: data['profileImageUrl'],
        deliveryFee: data['deliveryFee'] ?? 5.0,
      );
    }).toList();
    return businesses;
  }

  @override
  Future<void> updateBusinessName({
    required String uid,
    required String businessName,
  }) async {
    await _businessCollection.doc(uid).update({
      'businessName': businessName,
    });
  }

  @override
  Future<void> updateBusinessEmail({
    required String uid,
    required String businessEmail,
  }) async {
    await _businessCollection.doc(uid).update({
      'businessEmail': businessEmail,
    });
  }

  @override
  Future<void> updateBusinessPhoneNumber({
    required String uid,
    required String businessPhoneNumber,
  }) async {
    await _businessCollection.doc(uid).update({
      'businessPhoneNumber': businessPhoneNumber,
    });
  }

  @override
  Future<void> updateBusinessAddress({
    required String uid,
    required Map<String, dynamic> address,
  }) async {
    await _businessCollection.doc(uid).update({
      'address': address,
    });
  }

  @override
  Future<void> updateBusinessStatus({
    required String uid,
    required BusinessStatus status,
  }) async {
    await _businessCollection.doc(uid).update({
      'status': status.toString().split('.').last,
    });
  }

  @override
  Future<void> updateBusinessCategory({
    required String uid,
    required Map<String, dynamic> businessCategory,
  }) async {
    await _businessCollection.doc(uid).update({
      'businessCategory': businessCategory,
    });
  }

  @override
  Future<void> deleteBusinessProfile({required String uid}) async {
    await _businessCollection.doc(uid).delete();
  }

  @override
  Future<BusinessModel?> getBusinessProfileData({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final categories = (data['businessCategory'] as List<dynamic>)
          .map((e) {
            return BusinessCategory.values.firstWhere(
              (element) => element.toString().split('.').last == e,
              orElse: () => BusinessCategory
                  .other, // Handle case when enum value is not found
            );
          })
          .where((element) => true)
          .toSet();

      final offersIds = (data['offersIds'] as Map<String, dynamic>)
          .values
          .toSet()
          .cast<String>();

      return BusinessModel(
        id: uid,
        name: data['businessName'],
        email: data['businessEmail'],
        phoneNumber: data['businessPhoneNumber'],
        address: Address.fromJson(data['address']),
        status: BusinessStatus.values.firstWhere(
          (e) => e.toString().split('.').last == data['status'],
        ),
        categories: categories.toSet(),
        offersIds: offersIds,
        imageUrl: data['profileImageUrl'],
        deliveryFee: data['deliveryFee'] ?? 5.0,
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> updateBusinessOffers(
      {required String uid, required Set<String> offersIds}) {
    return _businessCollection.doc(uid).update({
      'offersIds': offersIds.toList(),
    });
  }

  @override
  Future<void> updateBusinessProfileImage(
      {required String uid, required File imageFile}) async {
    String storagePath = 'business_profile_images/$uid/profileImage';
    Reference storageRef = FirebaseStorage.instance.ref().child(storagePath);
    UploadTask uploadTask = storageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      if (data.containsKey('profileImageUrl')) {
        // Update 'profileImageUrl' field
        await _businessCollection.doc(uid).update({
          'profileImageUrl': downloadUrl,
        }).whenComplete(
            () => log(_businessCollection.doc(uid).get().toString()));
      } else {
        // Add 'profileImageUrl' field
        await _businessCollection.doc(uid).update({
          'profileImageUrl': downloadUrl,
        });
      }
    } else {
      log('Document does not exist');
    }
  }

  @override
  Future<double> getBusinessDeliveryFee(businessId) async {
    try {
      final docSnapshot = await _businessCollection.doc(businessId).get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return data['deliveryFee'] ?? 0.0;
      } else {
        return 0.0;
      }
    } catch (e) {
      log('Error getting delivery fee: $e');
      return 0.0;
    }
  }

  @override
  Future<void> updateBusinessDelivery(
      {required String uid, required double deliveryFee}) {
    return _businessCollection.doc(uid).update({
      'deliveryFee': deliveryFee,
    });
  }
}
