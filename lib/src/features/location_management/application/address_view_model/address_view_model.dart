import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import '../../../user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../presentation/widgets/address_form_widget.dart';
part 'address_view_model.g.dart';

@riverpod
class AddressViewModel extends _$AddressViewModel {
  @override
  FutureOr<void> build() {}

  void saveOrUpdateAddress({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String street,
    required String number,
    required String zipCode,
    required String neighborhood,
    required String city,
    required String state,
    String? businessId,
    Address? currentAddress,
  }) {
    if (formKey.currentState!.validate()) {
      if (businessId != null) {
        ref
            .read(businessProfileViewModelProvider.notifier)
            .updateBusinessAddress(
          businessId: businessId,
          address: {
            'street': street,
            'number': number,
            'zipCode': zipCode,
            'neighborhood': neighborhood,
            'city': city,
            'state': state,
          },
        ).then((value) => showSuccessDialog(context,
                message: 'Endereço atualizado com sucesso'));
        return;
      }

      var user = ref.watch(currentUserProvider);

      if (user == null) {
        return;
      }

      currentAddress != null
          ? ref.read(userProfileDataProvider).updateProfile(
              uid: user.id,
              address: {
                'street': street,
                'number': number,
                'zipCode': zipCode,
                'neighborhood': neighborhood,
                'city': city,
                'state': state,
              },
            ).then((value) => showSuccessDialog(context,
              message: 'Endereço atualizado com sucesso'))
          : ref
              .read(userProfileDataProvider)
              .addDeliveryAddress(uid: user.id, address: {
              'street': street,
              'number': number,
              'zipCode': zipCode,
              'neighborhood': neighborhood,
              'city': city,
              'state': state,
            }).then((value) => showSuccessDialog(context));
    }
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
    ).then((value) => Navigator.of(context).pop());
  }

  get validator {
    return ref.read(inputValidationProvider.notifier);
  }
}
