import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_marba/src/features/image_picker/application/image_field_controller.dart';
import 'package:project_marba/src/features/my_business/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/models/address/address.dart';
import '../../../../shared/models/business/enums.dart';
import '../../../authentication/data/firebase_auth_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../data/business_profile_data/business_profile_provider.dart';

part 'business_creation_controller.g.dart';

@riverpod
class BusinessCreationController extends _$BusinessCreationController {
  @override
  Business? build() {
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome do seu negócio';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || value.length < 15) {
      return 'Por favor, insira o número de telefone';
    }
    return null;
  }

  String? validateAddressStreet(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome da rua';
    }
    return null;
  }

  String? validateAddressNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o número';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a cidade';
    }
    return null;
  }

  String? validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o estado';
    }
    return null;
  }

  String? validateZipCode(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Por favor, insira o CEP';
    }
    return null;
  }

  String? validateNeighborhood(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o bairro';
    }
    return null;
  }

  String? validateCategories(Set<BusinessCategory> selectedCategories) {
    if (selectedCategories.isEmpty) {
      return 'Por favor, selecione pelo menos uma categoria';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  Future<void> validateAndSubmitForm({
    required GlobalKey<FormState> key,
    required String name,
    required String email,
    required String phoneNumber,
    required String street,
    required String number,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
    required Set<BusinessCategory> selectedCategories,
  }) async {
    if (key.currentState?.validate() ?? false) {
      final businessProfileRepository = ref.read(businessProfileDataProvider);
      final profileImage = ref.read(imageFieldControllerProvider);
      final business = Business(
        id: const Uuid().v4().toString(),
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        address: Address(
          street: street,
          number: number,
          neighborhood: neighborhood,
          city: city,
          state: state,
          zipCode: zipCode,
        ),
        categories: selectedCategories.toSet(),
        status: BusinessStatus.pending,
        offersIds: {},
      );
      await businessProfileRepository
          .createBusinessProfile(business: business)
          .then(
            (value) async => {
              if (profileImage != null)
                {
                  await businessProfileRepository.updateBusinessProfileImage(
                    uid: value!.id,
                    imageFile: profileImage,
                  ),
                },
              log('Business created successfully: ${value!.id}'),
              ref.read(userProfileDataProvider).addOwnedBusinessId(
                  uid: ref.read(authRepositoryProvider).getCurrentUser()!.uid,
                  businessId: business.id),
              await ref
                  .read(myBusinessListScreenControllerProvider.notifier)
                  .fetchUserBusinessList(),
            },
          );
    }
  }
}
