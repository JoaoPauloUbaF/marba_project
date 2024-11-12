import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/models/business/enums.dart';

part 'my_business_list_screen_controller.g.dart';

@riverpod
class MyBusinessListScreenController extends _$MyBusinessListScreenController {
  late Future<List<BusinessModel?>> listOfOwnedBusiness;
  late BusinessModel selectedBusiness;

  @override
  FutureOr<List<BusinessModel?>> build() async {
    return getUserBusinessList();
  }

  Future<List<BusinessModel>> getBusinessList(
      {required List<String> ownedBusinessIds}) async {
    final businessProfileRepository = ref.read(businessProfileDataProvider);
    List<BusinessModel> businessList = [];
    for (String id in ownedBusinessIds) {
      final business =
          await businessProfileRepository.getBusinessProfileData(uid: id);
      if (business != null) {
        businessList.add(business);
      }
    }
    return businessList;
  }

  void showDeleteBusinessConfirmationDialog(BuildContext context,
      {required String businessId}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.delete_business),
        content:
            Text(AppLocalizations.of(context)!.delete_business_confirmation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              return;
            },
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              deleteBusiness(businessId: businessId);
            },
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );
  }

  Future<void> deleteBusiness({required String businessId}) async {
    final businessProfileRepository = ref.read(businessProfileDataProvider);
    final userProfileRepository = ref.read(userProfileDataProvider);
    final offersDataRepository = ref.read(offersDataRepositoryProvider);
    await businessProfileRepository.deleteBusinessProfile(uid: businessId);
    await offersDataRepository.deleteBusinessOffers(businessId: businessId);
    await userProfileRepository.removeOwnedBusinessId(
        uid: ref.read(authRepositoryProvider).getCurrentUser()!.uid,
        businessId: businessId);

    var businessList = await getUserBusinessList();
    state = AsyncValue.data(businessList);
  }

  Future<List<BusinessModel?>> getUserBusinessList() async {
    final userProfileRepository = ref.read(userProfileDataProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final userOwnedBusinessIdsList = await userProfileRepository
        .getOwnedBusinessIds(uid: authRepository.getCurrentUser()?.uid ?? '');
    final userBusinessList =
        await getBusinessList(ownedBusinessIds: userOwnedBusinessIdsList);
    AsyncValue.data(userBusinessList);
    return userBusinessList;
  }

  String? validateBusinessName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome do negócio';
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

  FutureOr<void> fetchUserBusinessList() async {
    var businessList = await getUserBusinessList();
    state = AsyncValue.data(businessList);
  }

  void onTapBusiness(
      {required BusinessModel business, required BuildContext context}) {
    ref
        .read(businessProfileViewModelProvider.notifier)
        .setSelectedBusiness(business);

    Navigator.pushNamed(
      context,
      '/business-home',
    );
  }
}
