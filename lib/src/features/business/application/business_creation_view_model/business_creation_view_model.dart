import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/core/utils/translations_utils.dart';
import 'package:project_marba/src/features/image_picker/application/image_field_controller.dart';
import 'package:project_marba/src/features/business/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/models/business/enums.dart';
import '../../../authentication/data/firebase_auth_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../data/business_profile_data/business_profile_provider.dart';

part 'business_creation_view_model.g.dart';

@riverpod
class BusinessCreationViewModel extends _$BusinessCreationViewModel {
  late InputValidation inputValidation;
  @override
  BusinessModel? build() {
    inputValidation = ref.read(inputValidationProvider.notifier);
    return null;
  }

  String? validateName(String? value) {
    return inputValidation.validateName(value);
  }

  String? validatePhoneNumber(String? value) {
    return inputValidation.validatePhoneNumber(value);
  }

  String? validateAddressStreet(String? value) {
    return inputValidation.validateAddressStreet(value);
  }

  String? validateAddressNumber(String? value) {
    return inputValidation.validateAddressNumber(value);
  }

  String? validateCity(String? value) {
    return inputValidation.validateAddressCity(value);
  }

  String? validateState(String? value) {
    return inputValidation.validateAddressState(value);
  }

  String? validateZipCode(String? value) {
    return inputValidation.validateAddressZipCode(value);
  }

  String? validateNeighborhood(String? value) {
    return inputValidation.validateAddressNeighborhood(value);
  }

  String? validateCategories(Set<BusinessCategory> selectedCategories) {
    if (selectedCategories.isEmpty) {
      return 'Por favor, selecione pelo menos uma categoria';
    }
    return null;
  }

  String? validateEmail(String? value) {
    return inputValidation.validateEmail(value);
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
    final categoriesWords = selectedCategories
        .map((category) =>
            getBusinessCategoryTranslation(category).toLowerCase())
        .toSet();
    final nameWords = name.toLowerCase().split(' ');
    final businessProfileRepository = ref.read(businessProfileDataProvider);
    final profileImage = ref.read(imageFieldControllerProvider);

    final business = BusinessModel(
      id: const Uuid().v4().toString(),
      name: name,
      nameWords: nameWords,
      email: email,
      phoneNumber: phoneNumber,
      address: AddressModel.create(
        street: street,
        number: number,
        neighborhood: neighborhood,
        city: city,
        state: state,
        zipCode: zipCode,
      ),
      categories: selectedCategories.toSet(),
      categoriesWords: categoriesWords,
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
          title: Text(AppLocalizations.of(context)?.error ?? 'Error'),
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

  Future<FutureOr<void>> showSuccessDialog(
      BuildContext context, String value, File? businessProfileImage) async {
    await showDialog(
      context: context,
      builder: (context) {
        return BusinessCreationSuccessDialogWidget(
          value: value,
          businessProfileImage: businessProfileImage,
        );
      },
    );
  }

  Future<FutureOr<void>> showFailureDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text(
              'Ocorreu um erro ao criar o negócio. Por favor, tente novamente.'),
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
}

class BusinessCreationSuccessDialogWidget extends StatelessWidget {
  final String value;
  final File? businessProfileImage;

  const BusinessCreationSuccessDialogWidget({
    super.key,
    required this.value,
    this.businessProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Set the width
        height: MediaQuery.of(context).size.height * 0.4, // Set the height
        child: AlertDialog(
          title: Text(
            'Negócio',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Negócio',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        businessProfileImage == null
                            ? CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Text(
                                  value[0].toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    FileImage(businessProfileImage!),
                              ),
                        const Gap(8),
                        Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const Center(child: Text('Criado com sucesso!')),
                  ],
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
