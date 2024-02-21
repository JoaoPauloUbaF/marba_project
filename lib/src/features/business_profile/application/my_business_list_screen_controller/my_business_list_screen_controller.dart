import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_marba/src/features/business_profile/data/business_profile_provider.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/models/address/address.dart';

part 'my_business_list_screen_controller.g.dart';

@riverpod
class MyBusinessListScreenController extends _$MyBusinessListScreenController {
  @override
  FutureOr<void> build() {}

  Future<List<Business>> getBusinessList(
      {required List<String> ownedBusinessIds}) async {
    final businessProfileRepository = ref.read(businessProfileDataProvider);
    List<Business> businessList = [];
    for (String id in ownedBusinessIds) {
      final business =
          await businessProfileRepository.getBusinessProfileData(uid: id);
      if (business != null) {
        businessList.add(business);
      }
    }
    return businessList;
  }

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

  Future<void> validateAndSubmitForm(
      {required GlobalKey<FormState> key,
      required String name,
      required String email,
      required String phoneNumber,
      required String street,
      required String number,
      required String neighborhood,
      required String city,
      required String state,
      required String zipCode,
      required Set<BusinessCategory> selectedCategories}) async {
    if (key.currentState?.validate() ?? false) {
      final businessProfileRepository = ref.read(businessProfileDataProvider);
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
      await businessProfileRepository.createBusinessProfile(business: business);
    }
  }
}
