import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_data_repository.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/models/user/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/credit_card/credit_card_model.dart';

final firestoreProfileDataProvider = Provider<ProfileDataRepository>((ref) {
  return FirestoreProfileDataRepository();
});

class FirestoreProfileDataRepository implements ProfileDataRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<DocumentSnapshot?> createProfile({
    required String uid,
    required String phoneNumber,
  }) async {
    final user = UserModel(id: uid, phoneNumber: phoneNumber);
    await _usersCollection.doc(uid).set(user.toJson());
    return await _usersCollection.doc(uid).get();
  }

  @override
  Future<void> updateProfile({
    required UserModel user,
  }) async {
    await _usersCollection.doc(user.id).update(user.toJson());
  }

  @override
  Future<void> deleteProfile({required String uid}) async {
    await _usersCollection.doc(uid).delete().then((value) {
      log('User with id $uid deleted');
    }).catchError((error) {
      log('Failed to delete user with id $uid: $error');
    });
  }

  @override
  Stream<UserModel?> getProfileData({required String uid}) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      } else {
        return null;
      }
    });
  }

  @override
  Future<List<String>> getOwnedBusinessIds({required String uid}) async {
    DocumentSnapshot docSnapshot = await _usersCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final businessIds = data['ownedBusinessIds'];
      if (businessIds == null) {
        return Future.value([]);
      }
      return businessIds.cast<String>();
    } else {
      return Future.value([]);
    }
  }

  @override
  Future<void> addOwnedBusinessId({
    required String uid,
    required String businessId,
  }) async {
    await _usersCollection.doc(uid).update({
      'ownedBusinessIds': FieldValue.arrayUnion([businessId]),
    });
  }

  @override
  Future<void> removeOwnedBusinessId(
      {required String uid, required String businessId}) {
    return _usersCollection.doc(uid).update({
      'ownedBusinessIds': FieldValue.arrayRemove([businessId]),
    });
  }

  @override
  Future<void> addDeliveryAddress(
      {required String uid, required AddressModel address}) async {
    final user = await getProfileData(uid: uid).first;
    if (user == null) {
      return;
    }
    final updatedUser = user.copyWith(
      deliveryAddresses: [...?user.deliveryAddresses, address],
    );
    return updateProfile(user: updatedUser);
  }

  @override
  Future<void> updateDeliveryAddress(
      {required String uid, required AddressModel address}) async {
    final user = await getProfileData(uid: uid).first;
    if (user == null || user.deliveryAddresses == null) {
      return;
    }

    final updatedAddresses = user.deliveryAddresses
        ?.map((deliveryAddress) =>
            deliveryAddress.id == address.id ? address : deliveryAddress)
        .toList();
    final updatedUser = user.copyWith(deliveryAddresses: updatedAddresses);
    return updateProfile(user: updatedUser);
  }

  @override
  Future<void> addQueryToSearchHistory(
      {required String uid, required String query}) async {
    if (query.isEmpty || uid.isEmpty) {
      return;
    }

    DocumentSnapshot userDoc = await _usersCollection.doc(uid).get();

    if (userDoc.exists) {
      Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('searchHistory')) {
        // If 'searchHistory' field exists, update it
        return _usersCollection.doc(uid).update({
          'searchHistory': FieldValue.arrayUnion([query]),
        });
      } else {
        // If 'searchHistory' field doesn't exist, set it
        return _usersCollection.doc(uid).set({
          'searchHistory': [query],
        }, SetOptions(merge: true));
      }
    }
  }

  @override
  Stream<List<AddressModel>> getDeliveryAddresses({required String uid}) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final deliveryAddresses = data['deliveryAddresses']
            ?.map<AddressModel>((address) => AddressModel.fromJson(address))
            .toList();
        if (deliveryAddresses != null) {
          return deliveryAddresses;
        } else {
          return [];
        }
      } else {
        return [];
      }
    });
  }

  @override
  Future<List<String>> getSearchHistory({required String uid}) async {
    DocumentSnapshot doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return data['searchHistory']?.cast<String>() ?? [];
    } else {
      return [];
    }
  }

  @override
  Future<void> clearSearchHistory({required String uid}) async {
    return await _usersCollection.doc(uid).update({
      'searchHistory': FieldValue.delete(),
    });
  }

  @override
  Future<void> addFavoriteOfferId(
      {required String uid, required String offerId}) {
    return _usersCollection.doc(uid).update({
      'favoriteOfferIds': FieldValue.arrayUnion([offerId]),
    });
  }

  @override
  Future<void> removeFavoriteOfferId(
      {required String uid, required String offerId}) {
    return _usersCollection.doc(uid).update({
      'favoriteOfferIds': FieldValue.arrayRemove([offerId]),
    });
  }

  @override
  Future<Set<String>> getFavoriteOfferIds({required String uid}) async {
    DocumentSnapshot doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return data['favoriteOfferIds']?.cast<String>()?.toSet() ?? {};
    } else {
      return {};
    }
  }

  @override
  Future<FutureOr<void>> deleteDeliveryAddress(
      {required String uid, required AddressModel address}) async {
    await _usersCollection.doc(uid).update({
      'deliveryAddresses': FieldValue.arrayRemove([address.toJson()]),
    });
  }

  @override
  Stream<List<CreditCardModel>> getCreditCards({required String userId}) {
    return _usersCollection.doc(userId).snapshots().map((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final creditCards = data['creditCards']
            ?.map<CreditCardModel>((card) => CreditCardModel.fromJson(card))
            .toList();
        if (creditCards != null) {
          return creditCards;
        } else {
          return [];
        }
      } else {
        return [];
      }
    });
  }
}
