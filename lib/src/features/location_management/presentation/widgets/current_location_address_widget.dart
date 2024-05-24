import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_modal_widget.dart';

import '../../application/current_location_provider/current_location_provider.dart';

class CurrentLocationAddressWidget extends ConsumerWidget {
  const CurrentLocationAddressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(currentLocationProvider);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return locationAsyncValue.when(data: (address) {
                if (address == null) {
                  return const Text('No location');
                }
                return OrderAddressModalWidget(
                  //TODO: Make a modal to add the current location as a user address
                  currentSelectedAddress: address,
                );
              }, loading: () {
                return const CircularProgressIndicator();
              }, error: (error, stackTrace) {
                return Text('Error: $error');
              });
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                child: Icon(Icons.location_on_sharp, size: 12),
              ),
            ),
            const SizedBox(width: 8),
            locationAsyncValue.when(data: (location) {
              if (location == null) {
                return const Text('No location');
              }
              return RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: '${location.street}, ${location.number}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    // TextSpan(
                    //   text: '\n${location.neighborhood}, ${location.city}',
                    // )
                  ],
                ),
              );
            }, loading: () {
              return const CircularProgressIndicator();
            }, error: (error, stackTrace) {
              return Text('Error: $error');
            }),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_drop_down_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
