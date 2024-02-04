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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || value.length < 11) {
      return 'Please enter your phone number';
    }
    return null;
  }

  String? validateAddressStreet(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address street';
    }
    return null;
  }

  String? validateAddressNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address number';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your city';
    }
    return null;
  }

  String? validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your state';
    }
    return null;
  }

  String? validateZipCode(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Please enter your zip code';
    }
    return null;
  }

  String? validateNeighborhood(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your neighborhood';
    }
    return null;
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
      Address address = Address(
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
        print('Error submitting form: $e');
      }
    }
  }

  Future<void> createProfile({
    required String uid,
    required String displayName,
    required String phoneNumber,
    required Address address,
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

  List<DropdownMenuItem<String>> getStatesList() {
    return <String>[
      'AC',
      'AL',
      'AP',
      'AM',
      'BA',
      'CE',
      'DF',
      'ES',
      'GO',
      'MA',
      'MT',
      'MS',
      'MG',
      'PA',
      'PB',
      'PR',
      'PE',
      'PI',
      'RJ',
      'RN',
      'RS',
      'RO',
      'RR',
      'SC',
      'SP',
      'SE',
      'TO'
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
