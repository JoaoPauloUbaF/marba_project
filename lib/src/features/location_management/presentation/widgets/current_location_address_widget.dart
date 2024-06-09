import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_modal_widget.dart';
import '../../application/current_location_provider/current_location_provider.dart';

class CurrentLocationAddressWidget extends ConsumerWidget {
  const CurrentLocationAddressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(currentLocationProvider);

    void showAddressModal(BuildContext context, Address address) {
      final user = ref.read(authRepositoryProvider).getCurrentUser();
      showModalBottomSheet(
        context: context,
        builder: (context) {
          if (user == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Para mudar o endereço, faça login ou cadastre-se!'),
                  const Gap(16),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.tertiary,
                    )),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text(
                      'Fazer login',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }
          return AddressesModalWidget(
            currentSelectedAddress: address,
          );
        },
      );
    }

    return InkWell(
      onTap: locationAsyncValue.whenOrNull(
        data: (address) =>
            address != null ? () => showAddressModal(context, address) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.location_on_sharp, size: 16),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: locationAsyncValue.when(
                data: (location) {
                  if (location == null) {
                    return Text(
                      'Localização indisponível',
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${location.street}, ${location.number}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${location.neighborhood}, ${location.city}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) {
                  log('Error: $error');
                  return Text(
                    textAlign: TextAlign.center,
                    'Houve um erro\nao buscar sua localização',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_drop_down_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
