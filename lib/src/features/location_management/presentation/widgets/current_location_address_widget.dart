import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_modal_widget.dart';
import '../../application/current_location_provider/current_location_provider.dart';

class CurrentLocationAddressWidget extends ConsumerWidget {
  const CurrentLocationAddressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(currentLocationProvider);

    void showAddressModal(BuildContext context, Address address) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return OrderAddressModalWidget(
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
          locationAsyncValue.when(
              data: (location) {
                if (location == null) {
                  return Text(
                    'Localização indisponível',
                    style: Theme.of(context).textTheme.bodyMedium,
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
                    ),
                    Text(
                      '${location.neighborhood}, ${location.city}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
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
                );
              }),
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
