import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';

import '../../application/address_view_model/address_view_model.dart';
import '../../application/user_address_list_provider/user_address_list_provider.dart';
import 'address_form_widget.dart';

class OrderAddressModalWidget extends ConsumerStatefulWidget {
  final Address currentSelectedAddress;

  const OrderAddressModalWidget({
    super.key,
    required this.currentSelectedAddress,
  });

  @override
  ConsumerState<OrderAddressModalWidget> createState() =>
      _OrderAddressModalWidgetState();
}

class _OrderAddressModalWidgetState
    extends ConsumerState<OrderAddressModalWidget> {
  @override
  Widget build(BuildContext context) {
    final addressViewModel = ref.watch(addressViewModelProvider.notifier);
    final userAddresses = ref.watch(userAddressListProvider);
    final currentLocation = addressViewModel.getCurrentLocationAddress();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalCenterTopLineWidget(),
          const VerticalSpaceMediumWidget(),
          currentLocation.when(
            data: (currentLocation) {
              return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    scrollControlDisabledMaxHeightRatio: 0.7,
                    builder: (context) {
                      return AddressFormModalWidget(
                        title: 'Adicionar novo endereço',
                        currentAddress: currentLocation,
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_sharp,
                        color: Theme.of(context).colorScheme.onSecondary),
                    Text('Usar minha localização atual',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                  ],
                ),
              );
            },
            loading: () => const LoadingWidget(),
            error: (error, stackTrace) => const ElevatedButton(
              onPressed: null,
              child: Text('Houve um erro ao buscar sua localização atual'),
            ),
          ),
          const VerticalSpaceMediumWidget(),
          Expanded(
            child: userAddresses.when(
              data: (userAddresses) {
                return ref.watch(deliveryAddressProvider).when(
                      data: (currentSelectedAddress) => Scrollbar(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: userAddresses.length,
                          itemBuilder: (context, index) {
                            final address = userAddresses[index];
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                tileColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                selectedTileColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant
                                    .withAlpha(100),
                                leading: const Icon(Icons.location_on_sharp,
                                    size: 30),
                                title: Text(
                                    '${address.street}, ${address.number}, ${address.neighborhood}, ${address.city}'),
                                subtitle: const Text('Casa'),
                                selected: address == currentSelectedAddress,
                                onTap: () {
                                  addressViewModel
                                      .selectDeliveryAddress(address);
                                },
                                trailing: Radio(
                                  value: index,
                                  groupValue: userAddresses
                                      .indexOf(currentSelectedAddress!),
                                  onChanged: (value) {
                                    addressViewModel
                                        .selectDeliveryAddress(address);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      loading: () => const LoadingWidget(),
                      error: (error, stackTrace) => const Center(
                        child: Text(
                            'Houve um erro ao buscar seus endereços, tente novamente mais tarde',
                            textAlign: TextAlign.center),
                      ),
                    );
              },
              loading: () => const LoadingWidget(),
              error: (error, stackTrace) => const Center(
                child: Text(
                    'Houve um erro ao buscar seus endereços, tente novamente mais tarde',
                    textAlign: TextAlign.center),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  scrollControlDisabledMaxHeightRatio: 0.7,
                  builder: (context) {
                    return const AddressFormModalWidget(
                      title: 'Adicionar novo endereço',
                      currentAddress: null,
                    );
                  },
                );
              },
              child: Text(
                'Adicionar novo endereço',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
