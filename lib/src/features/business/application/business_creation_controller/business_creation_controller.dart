import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_marba/src/features/image_picker/application/image_field_controller.dart';
import 'package:project_marba/src/features/business/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/models/business/enums.dart';
import '../../../authentication/data/firebase_auth_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../data/business_profile_data/business_profile_provider.dart';

part 'business_creation_controller.g.dart';

@riverpod
class BusinessCreationController extends _$BusinessCreationController {
  @override
  BusinessModel? build() {
    return null;
  }

  dispose() {
    state = null;
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

  Future<void> submitForm({
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
    required String deliveryFee,
  }) async {
    final businessProfileRepository = ref.read(businessProfileDataProvider);
    final profileImage = ref.read(imageFieldControllerProvider);
    final business = BusinessModel(
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
      deliveryFee: 0.0,
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
                ref.refresh(imageFieldControllerProvider),
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

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void showMissingFieldsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro'),
          content:
              const Text('Por favor, preencha todos os campos corretamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context, String value) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // Set the width
            height: MediaQuery.of(context).size.height * 0.3, // Set the height
            child: AlertDialog(
              title: Column(
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Negócio\n',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: value,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              content: const Center(child: Text('Criado com sucesso!')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
