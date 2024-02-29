import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../shared/models/address/address.dart';
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
    required Business business,
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
  Future<Business?> getBusinessProfileData({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final categories = (data['businessCategory'] as List<dynamic>)
          .map((e) {
            return BusinessCategory.values.firstWhere(
              (element) => element.toString().split('.').last == e,
              orElse: () => BusinessCategory
                  .services, // Handle case when enum value is not found
            );
          })
          .where((element) => true)
          .toSet();

      final offersIds = (data['offersIds'] as Map<String, dynamic>)
          .values
          .toSet()
          .cast<String>();

      return Business(
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
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> addOffer({required String uid, required String offerId}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List<String> offersIds = data['offersIds'].cast<String>();
      offersIds.add(offerId);
      await _businessCollection.doc(uid).update({
        'offersIds': offersIds,
      });
    }
  }

  @override
  Future<void> removeOffer(
      {required String uid, required String offerId}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List<String> offersIds = data['offersIds'].cast<String>();
      offersIds.remove(offerId);
      await _businessCollection.doc(uid).update({
        'offersIds': offersIds,
      });
    }
  }

  @override
  Future<void> updateOffer(
      {required String uid, required String offerId}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List<String> offersIds = data['offersIds'].cast<String>();
      offersIds.add(offerId);
      await _businessCollection.doc(uid).update({
        'offersIds': offersIds,
      });
    }
  }

  @override
  Future<Map<String, dynamic>?> getBusinessAddress(
      {required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['address'];
    } else {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getBusinessCategory(
      {required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['businessCategory'];
    } else {
      return null;
    }
  }

  @override
  Future<String?> getBusinessEmail({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['businessEmail'];
    } else {
      return null;
    }
  }

  @override
  Future<String?> getBusinessId({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      return uid;
    } else {
      return null;
    }
  }

  @override
  Future<String?> getBusinessName({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['businessName'];
    } else {
      return null;
    }
  }

  @override
  Future<String?> getBusinessPhoneNumber({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['businessPhoneNumber'];
    } else {
      return null;
    }
  }

  @override
  Future<BusinessStatus?> getBusinessStatus({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return BusinessStatus.values.firstWhere(
        (e) => e.toString().split('.').last == data['status'],
      );
    } else {
      return null;
    }
  }

  @override
  Future<Set<String>?> getOffersIds({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['offersIds'].toSet();
    } else {
      return null;
    }
  }

  @override
  Future<void> updateOffers(
      {required String uid, required Set<String> offersIds}) {
    return _businessCollection.doc(uid).update({
      'offersIds': offersIds.toList(),
    });
  }

  @override
  Future<void> updateBusinessProfileImage(
      {required String uid, required File imageFile}) async {
    // Upload image to Firebase Storage
    String storagePath =
        'business_profile_images/$uid/${DateTime.now().millisecondsSinceEpoch}';
    Reference storageRef = FirebaseStorage.instance.ref().child(storagePath);
    UploadTask uploadTask = storageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    // Check if 'profileImageUrl' field exists
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      if (data.containsKey('profileImageUrl')) {
        // Update 'profileImageUrl' field
        await _businessCollection.doc(uid).update({
          'profileImageUrl': downloadUrl,
        }).whenComplete(
            () => print(_businessCollection.doc(uid).get().toString()));
      } else {
        // Add 'profileImageUrl' field
        await _businessCollection.doc(uid).update({
          'profileImageUrl': downloadUrl,
        });
      }
    } else {
      print('Document does not exist');
    }
  }
}
