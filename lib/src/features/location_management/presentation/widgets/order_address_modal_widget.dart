import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/loading_widget.dart';

import '../../application/user_address_list_provider/user_address_list_provider.dart';
import '../../../shopping/application/delivery_address_provider/delivery_address_provider.dart';
import 'order_address_form_widget.dart';

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
    final userAddresses = ref.watch(userAddressListProvider);
    Address currentSelectedAddress = widget.currentSelectedAddress;
    ref
        .watch(deliveryAddressProvider)
        .whenData((value) => currentSelectedAddress = value!);

    return SingleChildScrollView(
      child: userAddresses.when(
        data: (userAddresses) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ModalCenterTopLineWidget(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Selecione o endereço de entrega',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withAlpha(100),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Scrollbar(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: userAddresses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              const Icon(Icons.location_on_sharp, size: 30),
                          title: Text(
                              '${userAddresses[index].street}, ${userAddresses[index].number}, ${userAddresses[index].neighborhood}, ${userAddresses[index].city}'),
                          subtitle: const Text('Casa'),
                          selected:
                              userAddresses[index] == currentSelectedAddress,
                          onTap: () => ref
                              .read(deliveryAddressProvider.notifier)
                              .setDeliveryAddress(userAddresses[index]),
                          trailing: Radio(
                            value: index,
                            groupValue:
                                userAddresses.indexOf(currentSelectedAddress),
                            onChanged: (value) {
                              ref
                                  .read(deliveryAddressProvider.notifier)
                                  .setDeliveryAddress(userAddresses[index]);
                            },
                          ),
                        );
                      },
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => Text('Erro: $error'),
      ),
    );
  }
}
