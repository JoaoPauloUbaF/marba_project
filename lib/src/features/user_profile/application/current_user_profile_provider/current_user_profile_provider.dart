import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/core/models/user/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/user_firestore_profile_data_provider.dart';

part 'current_user_profile_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  UserModel? build() {
    ref.watch(authStateChangeProvider);
    final uid = ref.read(authRepositoryProvider).getCurrentUser()?.uid;

    if (uid == null) {
      return null;
    }

    ref
        .watch(firestoreProfileDataProvider)
        .getProfileData(uid: uid)
        .then((value) => state = value);
    return null;
  }
}
