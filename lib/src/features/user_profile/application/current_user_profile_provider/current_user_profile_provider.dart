import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/shared/models/user/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/user_firestore_profile_data_provider.dart';

part 'current_user_profile_provider.g.dart';

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  Future<UserModel?>? build() async {
    final uid = ref.read(authRepositoryProvider).getCurrentUser()?.uid;

    if (uid == null) {
      return null;
    }

    return await ref
        .read(firestoreProfileDataProvider)
        .getProfileData(uid: uid);
  }
}
