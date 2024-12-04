import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_forms_screen_controller.g.dart';

@riverpod
class ProfileFormsScreenController extends _$ProfileFormsScreenController {
  @override
  FutureOr<void> build() {}

  String? validateName(String? value) {
    return ref.read(inputValidationProvider.notifier).validateName(value);
  }

  String? validatePhoneNumber(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validatePhoneNumber(value);
  }

  String? validateAddressStreet(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validateAddressStreet(value);
  }

  String? validateAddressNumber(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validateAddressNumber(value);
  }

  String? validateCity(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validateAddressCity(value);
  }

  String? validateState(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validateAddressState(value);
  }

  String? validateZipCode(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validateAddressZipCode(value);
  }

  String? validateNeighborhood(String? value) {
    return ref
        .read(inputValidationProvider.notifier)
        .validateAddressNeighborhood(value);
  }

  Future<void> validateAndSubmitForm({
    required GlobalKey<FormState> formKey,
    required String uid,
    required String displayName,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        await createProfile(
          uid: uid,
          displayName: displayName,
          phoneNumber: phoneNumber,
        ).then((value) => onSubmit(context));
      } catch (e) {
        log('Error submitting form: $e');
      }
    }
  }

  Future<void> createProfile({
    required String uid,
    required String displayName,
    required String phoneNumber,
  }) async {
    final userRepository = ref.read(userProfileDataProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => userRepository
        .createProfile(
          uid: uid,
          phoneNumber: phoneNumber,
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
