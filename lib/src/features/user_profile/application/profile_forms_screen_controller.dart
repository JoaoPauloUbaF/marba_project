import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/shared/models/address/address.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_forms_screen_controller.g.dart';

@riverpod
class ProfileFormsScreenController extends _$ProfileFormsScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> createProfile({
    required String uid,
    required String displayName,
    required String phoneNumber,
    required Address address,
  }) async {
    final userRepository = ref.read(profileDataProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => userRepository
        .createProfile(
          uid: uid,
          displayName: displayName,
          phoneNumber: phoneNumber,
          address: address.toJson(),
        )
        .then(
          (value) => ref
              .read(authRepositoryProvider)
              .getCurrentUser()
              ?.updateDisplayName(displayName),
        ));
  }

  void onSubmit(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}
