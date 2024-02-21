import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/shared/models/user/user_model.dart';

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

  Future<List<String>> getOwnedBusinessIds({required String uid});
}
