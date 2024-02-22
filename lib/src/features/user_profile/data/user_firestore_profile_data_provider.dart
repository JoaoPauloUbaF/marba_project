import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_data_repository.dart';
import 'package:project_marba/src/shared/models/address/address.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:project_marba/src/shared/models/user/user_model.dart';
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
        isBusinessOwner: false,
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
}
