import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/address/address.dart';
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
    required String street,
    required String number,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
    required BuildContext context,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      AddressModel address = AddressModel.create(
        street: street,
        number: number,
        neighborhood: neighborhood,
        city: city,
        state: state,
        zipCode: zipCode,
      );
      try {
        await createProfile(
          uid: uid,
          displayName: displayName,
          phoneNumber: phoneNumber,
          address: address,
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
    required AddressModel address,
  }) async {
    final userRepository = ref.read(userProfileDataProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => userRepository
        .createProfile(
          uid: uid,
          displayName: displayName,
          phoneNumber: phoneNumber,
          address: address.toJson(),
          email: ref.read(authRepositoryProvider).getCurrentUser()?.email ?? '',
        )
        .then(
          (value) => ref
              .read(authRepositoryProvider)
              .getCurrentUser()
              ?.updateDisplayName(displayName),
        ));
  }

  Widget getSubmitButtonWidget() {
    if (state.isLoading) {
      return const CircularProgressIndicator();
    } else {
      return const Text('Save Profile');
    }
  }

  void onSubmit(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}
