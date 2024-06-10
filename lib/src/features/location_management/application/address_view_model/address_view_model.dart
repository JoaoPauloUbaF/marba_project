import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:project_marba/src/features/location_management/application/user_address_list_provider/user_address_list_provider.dart';
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
    required BuildContext context,
    required Address address,
    String? businessId,
    Address? currentAddress,
  }) {
    if (businessId != null) {
      ref.read(businessProfileViewModelProvider.notifier).updateBusinessAddress(
        businessId: businessId,
        address: {
          'street': address.street,
          'number': address.number,
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
          ref.read(userProfileDataProvider).updateProfile(
            uid: user.id,
            address: {
              'street': address.street,
              'number': address.number,
              'zipCode': address.zipCode,
              'neighborhood': address.neighborhood,
              'city': address.city,
              'state': address.state,
            },
          ).then((value) => showSuccessDialog(context,
              message: 'Endereço atualizado com sucesso'));
        } else {
          String message = addresses.contains(address)
              ? 'Endereço atualizado'
              : 'Endereço salvo com sucesso';
          ref.read(userProfileDataProvider).addOrUpdateDeliveryAddress(
            uid: user.id,
            address: {
              'street': address.street,
              'number': address.number,
              'zipCode': address.zipCode,
              'neighborhood': address.neighborhood,
              'city': address.city,
              'state': address.state,
            },
          ).then((value) => showSuccessDialog(context, message: message));
        }
      },
      loading: () => null,
      error: (error, stackTrace) {
        throw Exception('Error : $error');
      },
    );
  }

  void onAddressTileTap(
      BuildContext context, Address address, bool isBusinessAddress) {
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
    ).then(
        (value) => {Navigator.of(context).pop(), Navigator.of(context).pop()});
  }

  get validator {
    return ref.read(inputValidationProvider.notifier);
  }

  AsyncValue<List<Address>> getUserAddresses() {
    return ref.watch(userAddressListProvider);
  }

  AsyncValue getCurrentLocationAddress() {
    return ref.watch(currentLocationProvider);
  }

  void selectDeliveryAddress(Address address) {
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

  Future<Address> getPredictionAddress(
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
        number.isEmpty ||
        neighborhood.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        zipCode.isEmpty) {
      List<String> missingFields = [];
      if (street.isEmpty) missingFields.add('Rua');
      if (number.isEmpty) missingFields.add('Número');
      if (neighborhood.isEmpty) missingFields.add('Bairro');
      if (city.isEmpty) missingFields.add('Cidade');
      if (state.isEmpty) missingFields.add('Estado');
      if (zipCode.isEmpty) missingFields.add('CEP');

      throw Exception(
          'Ops! Faltam essas informações no seu endereço: \n${missingFields.join(', ')}');
    }

    return Address(
      street: street,
      number: number,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }

  void showConfirmAddressDialog(Address address, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirme o endereço'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rua: ${address.street}'),
              Text('Número: ${address.number}'),
              Text('Bairro: ${address.neighborhood}'),
              Text('Cidade: ${address.city}'),
              Text('Estado: ${address.state}'),
              Text('CEP: ${address.zipCode}'),
              const TextField(
                decoration: InputDecoration(
                  //TODO:  add complement do address
                  labelText: 'Complemento',
                  hintText: 'Ex: Apto 101, Bloco A, etc.',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Apelido',
                  hintText: 'Ex: Casa, Trabalho, etc.',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                saveOrUpdateAddress(context: context, address: address);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void showEdit(Address address, BuildContext context) {
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

  void confirmDeleteAddress(Address address, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirme a exclusão'),
          content: const Text('Deseja realmente excluir este endereço?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                ref.read(userProfileDataProvider).deleteDeliveryAddress(
                      uid: ref.read(currentUserProvider)!.id,
                      address: address,
                    );
                if (ref.read(deliveryAddressProvider).requireValue == address) {
                  ref.invalidate(currentLocationProvider);
                  ref.invalidate(deliveryAddressProvider);
                }

                Navigator.of(context).pop();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
