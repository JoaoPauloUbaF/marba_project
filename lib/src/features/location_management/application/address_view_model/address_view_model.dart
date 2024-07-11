import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:project_marba/src/features/location_management/application/user_address_list_provider/user_address_list_provider.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/confirm_address_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import '../../../shopping/application/delivery_address_provider/delivery_address_provider.dart';
import '../../../user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../presentation/widgets/address_form_widget.dart';
import '../current_location_provider/current_location_provider.dart';
part 'address_view_model.g.dart';

@riverpod
class AddressViewModel extends _$AddressViewModel {
  final FlutterGooglePlacesSdk _places =
      FlutterGooglePlacesSdk(dotenv.env['GOOGLE_API_KEY'] ?? '');

  @override
  FutureOr<void> build() {}

  void saveOrUpdateAddress({
    //TODO: break this method into smaller methods
    required BuildContext context,
    required AddressModel address,
    String? businessId,
    AddressModel? currentAddress,
  }) {
    if (businessId != null) {
      ref.read(businessProfileViewModelProvider.notifier).updateBusinessAddress(
        businessId: businessId,
        address: {
          'street': address.street,
          'number': address.number ?? '',
          'zipCode': address.zipCode,
          'neighborhood': address.neighborhood,
          'city': address.city,
          'state': address.state,
        },
      ).then((value) => showSuccessDialog(context,
          message: 'Endereço atualizado com sucesso'));
      return;
    }

    var user = ref.watch(currentUserProvider);

    if (user == null) {
      return;
    }

    final addresses = ref.read(userAddressListProvider);
    addresses.when(
      data: (addresses) {
        if (addresses.contains(address) && user.address == address) {
          try {
            ref
                .read(userProfileDataProvider)
                .updateProfile(
                  user: user.copyWith(address: address),
                )
                .then((value) => showSuccessDialog(context,
                    message: 'Endereço atualizado com sucesso'));
          } on Exception catch (e) {
            showFailureDialog(context);
            throw Exception('Error : $e');
          }
        } else {
          String message = addresses.contains(address)
              ? 'Endereço atualizado'
              : 'Endereço salvo com sucesso';
          try {
            ref.read(userProfileDataProvider).addOrUpdateDeliveryAddress(
              uid: user.id,
              address: {
                'street': address.street,
                'number': address.number,
                'zipCode': address.zipCode,
                'neighborhood': address.neighborhood,
                'city': address.city,
                'state': address.state,
                'complement': address.complement,
                'nickname': address.nickname,
              },
            ).then((value) => showSuccessDialog(context, message: message));
          } on Exception catch (e) {
            showFailureDialog(context);
            throw Exception('Error : $e');
          }
        }
      },
      loading: () => null,
      error: (error, stackTrace) {
        throw Exception('Error : $error');
      },
    );
  }

  void onAddressTileTap(
      BuildContext context, AddressModel address, bool isBusinessAddress) {
    if (isBusinessAddress) {
      final businessViewModel =
          ref.read(businessProfileViewModelProvider.notifier);
      businessViewModel.isBusinessOwner().then(
        (isOwner) {
          if (!isOwner) return;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(0),
                content: AddressFormModalWidget(
                  currentAddress: address,
                  businessId: businessViewModel.getBusinessId(),
                  title: 'Editar Endereço',
                ),
              );
            },
          );
        },
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: AddressFormModalWidget(
            currentAddress: address,
            title: 'Editar Endereço',
          ),
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Center(child: Text('Sucesso')),
        content: Text(message ?? 'Endereço salvo com sucesso'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    ).then((value) => Navigator.of(context).pop());
  }

  get validator {
    return ref.read(inputValidationProvider.notifier);
  }

  AsyncValue<List<AddressModel>> getUserAddresses() {
    return ref.watch(userAddressListProvider);
  }

  AsyncValue getCurrentLocationAddress() {
    return ref.watch(currentLocationProvider);
  }

  void selectDeliveryAddress(AddressModel address) {
    ref.read(deliveryAddressProvider.notifier).setDeliveryAddress(address);
  }

  FutureOr<void> onPredictionSelected(
      {required AutocompletePrediction prediction,
      required BuildContext context}) {
    getPredictionAddress(prediction: prediction).then((address) {
      showConfirmAddressDialog(address, context);
    }).catchError((error) {
      String errorMessage;
      if (error is Exception) {
        errorMessage = error.toString().replaceFirst('Exception: ', '');
      } else {
        errorMessage = 'Erro inesperado';
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Erro')),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    });
  }

  Future<AddressModel> getPredictionAddress(
      {required AutocompletePrediction prediction}) async {
    final placeDetails = await _places.fetchPlace(
      prediction.placeId,
      fields: [PlaceField.AddressComponents],
    );
    final place = placeDetails.place;

    if (place == null || place.addressComponents == null) {
      return Future(() => throw Exception('Este endereço não é válido'));
    }

    String street = '';
    String number = '';
    String neighborhood = '';
    String city = '';
    String state = '';
    String zipCode = '';

    for (var component in place.addressComponents!) {
      if (component.types.contains('street_number')) {
        number = component.name;
      } else if (component.types.contains('route')) {
        street = component.name;
      } else if (component.types.contains('sublocality') ||
          component.types.contains('sublocality_level_1')) {
        neighborhood = component.name;
      } else if (component.types.contains('locality') ||
          component.types.contains('administrative_area_level_2')) {
        city = component.name;
      } else if (component.types.contains('administrative_area_level_1')) {
        state = component.shortName; // Use shortName for state abbreviations
      } else if (component.types.contains('postal_code')) {
        zipCode = component.name;
      }
    }

    // Verifique se todos os campos necessários estão preenchidos
    if (street.isEmpty ||
        neighborhood.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        zipCode.isEmpty) {
      List<String> missingFields = [];
      if (street.isEmpty) missingFields.add('Rua');
      if (neighborhood.isEmpty) missingFields.add('Bairro');
      if (city.isEmpty) missingFields.add('Cidade');
      if (state.isEmpty) missingFields.add('Estado');
      if (zipCode.isEmpty) missingFields.add('CEP');

      throw Exception(
          'Ops! Faltam essas informações no seu endereço: \n${missingFields.join(', ')}');
    }

    return AddressModel.create(
      street: street,
      number: number,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }

  void onUseCurrentAddressTap(BuildContext context) async {
    showLoader(context);
    await Future.delayed(const Duration(milliseconds: 500));
    await ref.read(currentLocationProvider.notifier).getCurrentLocation().then(
      (value) {
        hideLoader(context);
        if (value == null) {
          return;
        }
        showConfirmAddressDialog(value, context);
      },
    );
  }

  void showConfirmAddressDialog(AddressModel address, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          title: const Text('Confirme o endereço'),
          content: ConfirmAddressForm(address: address),
        );
      },
    );
  }

  void showEdit(AddressModel address, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BaseModalBodyWidget(
          child: AddressFormModalWidget(
            currentAddress: address,
            title: 'Editar Endereço',
          ),
        );
      },
    );
  }

  Future<FutureOr<void>> deleteAddress({required AddressModel address}) async {
    final user = ref.read(currentUserProvider);

    if (user == null) {
      return null;
    }

    try {
      await ref.read(userProfileDataProvider).deleteDeliveryAddress(
            uid: user.id,
            address: address,
          );
    } on Exception catch (e) {
      throw Exception('Error : $e');
    }
    if (ref.read(deliveryAddressProvider).requireValue == address) {
      ref.invalidate(currentLocationProvider);
      ref.invalidate(deliveryAddressProvider);
    }

    ref.invalidate(userAddressListProvider);
  }

  Future<bool> confirmDeleteAddress(
      AddressModel address, BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deletar endereço'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Tem certeza que deseja deletar este endereço?'),
              const Gap(20),
              Text('Rua: ${address.street}'),
              Text('Número: ${address.number}'),
              Text('Bairro: ${address.neighborhood}'),
              Text('Cidade: ${address.city}'),
              Text('Estado: ${address.state}'),
              Text('CEP: ${address.zipCode}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Deletar'),
            ),
          ],
        );
      },
    );
    return shouldDelete ?? false;
  }

  void showFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Center(child: Text('Erro')),
        content: const Text('Erro ao salvar endereço'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Widget? buildAddressTitle(AddressModel address) {
    String titleText = '';
    if (address.street.isNotEmpty) {
      titleText += '${address.street}, ';
    }
    if (address.number != null && address.number!.isNotEmpty) {
      titleText += '${address.number}';
    }
    if (address.neighborhood.isNotEmpty) {
      titleText += ' - ${address.neighborhood}';
    }
    if (address.city.isNotEmpty) {
      titleText += ', ${address.city}';
    }
    return titleText.isNotEmpty ? Text(titleText) : null;
  }

  Widget? buildAddressSubtitle(AddressModel address) {
    String subtitleText = '';
    if (address.nickname != null && address.nickname!.isNotEmpty) {
      subtitleText += '${address.nickname}, ';
    }
    if (address.complement != null && address.complement!.isNotEmpty) {
      subtitleText += '${address.complement}';
    }
    return subtitleText.isNotEmpty ? Text(subtitleText) : null;
  }
}
