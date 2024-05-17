import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_data_repository.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/models/user/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProfileDataProvider = Provider<ProfileDataRepository>((ref) {
  return FirestoreProfileDataRepository();
});

class FirestoreProfileDataRepository implements ProfileDataRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<DocumentSnapshot?> createProfile({
    required String uid,
    required String displayName,
    required String phoneNumber,
    required Map<String, dynamic> address,
    required String? email,
  }) async {
    await _usersCollection.doc(uid).set({
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'address': address,
      'deliveryAddresses': [address],
      'email': email,
    });
    return await _usersCollection.doc(uid).get();
  }

  @override
  Future<void> updateProfile({
    required String uid,
    String? displayName,
    String? phoneNumber,
    required Map<String, dynamic> address,
  }) async {
    await _usersCollection.doc(uid).update({
      if (displayName != null) 'displayName': displayName,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      'address': address,
    });
  }

  @override
  Future<void> deleteProfile({required String uid}) async {
    await _usersCollection.doc(uid).delete();
  }

  @override
  Future<UserModel?> getProfileData({required String uid}) async {
    DocumentSnapshot docSnapshot = await _usersCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return UserModel(
        id: uid,
        email: data['email'],
        displayName: data['displayName'],
        phoneNumber: data['phoneNumber'],
        address: Address.fromJson(data['address']),
        deliveryAddresses: data['deliveryAddresses']
            ?.map<Address>((address) => Address.fromJson(address))
            .toList(),
        isBusinessOwner: false,
        ownedBusinessIds:
            data['ownedBusinessIds']?.cast<String>()?.toSet() ?? [],
        favoriteOfferIds:
            data['favoriteOfferIds']?.cast<String>()?.toSet() ?? [],
        searchHistory: data['searchHistory']?.cast<String>(),
      );
    } else {
      return null;
    }
  }

  @override
  Future<List<String?>> getOwnedBusinessIds({required String uid}) async {
    DocumentSnapshot docSnapshot = await _usersCollection.doc(uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      final businessIds = data['ownedBusinessIds'];
      return businessIds.cast<String>();
    } else {
      return [];
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
      {required String uid, required Map<String, dynamic> address}) {
    return _usersCollection.doc(uid).update({
      'deliveryAddresses': FieldValue.arrayUnion([address]),
    });
  }

  @override
  Future<void> addQueryToSearchHistory(
      {required String uid, required String query}) async {
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
  Stream<List<Address>> getDeliveryAddresses({required String uid}) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['deliveryAddresses']
            ?.map<Address>((address) => Address.fromJson(address))
            .toList();
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
}
