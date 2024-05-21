import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../user_profile/data/user_profile_provider.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  int build() {
    return 0;
  }

  Future<bool?> hasBusiness() async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      return false;
    }

    final hasBusiness = await ref
        .read(userProfileDataProvider)
        .getOwnedBusinessIds(uid: user.uid);
    return hasBusiness.isNotEmpty;
  }

  void isUserRegistrationComplete(BuildContext context) async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      return null;
    }
    await ref.read(authRepositoryProvider).checkUserRegistration(user.uid).then(
        (value) => value
            ? null
            : Navigator.pushNamedAndRemoveUntil(
                context, '/profile-form', (route) => false));
  }
}
