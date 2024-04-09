import 'package:flutter/material.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../business/presentation/widgets/loading_widget.dart';
import '../../../user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
part 'address_view_model.g.dart';

@riverpod
class AddressViewModel extends _$AddressViewModel {
  @override
  FutureOr<void> build() {}

  void onAddressTileTap({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String street,
    required String number,
    required String zipCode,
    required String neighborhood,
    required String city,
    required String state,
  }) {
    if (formKey.currentState!.validate()) {
      var user = ref.watch(currentUserProvider);

      user.when(
        data: (user) {
          if (user == null) {
            return;
          }

          ref
              .read(userProfileDataProvider)
              .addDeliveryAddress(uid: user.id, address: {
            'street': street,
            'number': number,
            'zipCode': zipCode,
            'neighborhood': neighborhood,
            'city': city,
            'state': state,
          }).then(
            (value) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Center(child: Text('Sucesso')),
                content: const Text('Endereço adicionado com sucesso'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ).then((value) => Navigator.of(context).pop()),
          );
        },
        loading: () {
          showDialog(
            context: context,
            builder: (_) => const LoadingWidget(),
          );
        },
        error: (error, stackTrace) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Erro'),
                    content: Text('Erro: $error'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  )).then((value) => Navigator.of(context).pop());
        },
      );
    }
  }

  get validator {
    return ref.read(inputValidationProvider.notifier);
  }
}
