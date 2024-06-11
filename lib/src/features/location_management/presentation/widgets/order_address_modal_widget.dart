import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';

import '../../application/address_view_model/address_view_model.dart';
import '../../application/user_address_list_provider/user_address_list_provider.dart';
import 'address_form_widget.dart';

class AddressesManagementWidget extends ConsumerStatefulWidget {
  const AddressesManagementWidget({
    super.key,
  });

  @override
  ConsumerState<AddressesManagementWidget> createState() =>
      _OrderAddressManagementWidgetState();
}

class _OrderAddressManagementWidgetState
    extends ConsumerState<AddressesManagementWidget> {
  @override
  Widget build(BuildContext context) {
    final addressViewModel = ref.watch(addressViewModelProvider.notifier);
    final userAddresses = ref.watch(userAddressListProvider);
    return Column(
      children: [
        AddressManagementHeaderButtons(addressViewModel: addressViewModel),
        const VerticalSpaceMediumWidget(),
        AddressList(
            userAddresses: userAddresses,
            ref: ref,
            addressViewModel: addressViewModel),
        const AddNewAddressButton(),
        const Gap(8)
      ],
    );
  }
}

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const BaseModalBodyWidget(
                child: AddressFormModalWidget(
                  title: 'Adicionar novo endereço',
                  currentAddress: null,
                ),
              );
            },
          );
        },
        child: Text(
          'Adicionar novo endereço',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
        ),
      ),
    );
  }
}

class AddressList extends StatefulWidget {
  const AddressList({
    super.key,
    required this.userAddresses,
    required this.ref,
    required this.addressViewModel,
  });

  final AsyncValue<List<AddressModel>> userAddresses;
  final WidgetRef ref;
  final AddressViewModel addressViewModel;

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.userAddresses.when(
        data: (userAddresses) {
          return widget.ref.watch(deliveryAddressProvider).when(
                data: (currentSelectedAddress) => Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: userAddresses.length,
                    itemBuilder: (context, index) {
                      final address = userAddresses[index];
                      return buildAddressTile(context, address,
                          currentSelectedAddress, index, userAddresses);
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
    );
  }

  Widget buildAddressTile(
      BuildContext context,
      AddressModel address,
      AddressModel? currentSelectedAddress,
      int index,
      List<AddressModel> userAddresses) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Slidable(
        key: ValueKey(address.city + address.neighborhood + address.street),
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          dismissible: DismissiblePane(
              closeOnCancel: true,
              confirmDismiss: () => widget.addressViewModel
                  .confirmDeleteAddress(address, context),
              onDismissed: () async {
                await widget.addressViewModel.deleteAddress(address: address);
                setState(() {
                  userAddresses.remove(address);
                });
              }),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.addressViewModel.confirmDeleteAddress(address, context);
              },
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              icon: Icons.delete,
              label: 'Deletar',
            ),
          ],
        ),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(
            confirmDismiss: () {
              widget.addressViewModel.showEdit(address, context);
              return Future.value(false);
            },
            onDismissed: () {
              widget.addressViewModel.showEdit(address, context);
            },
            closeOnCancel: true,
          ),
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                widget.addressViewModel.showEdit(address, context);
              },
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              foregroundColor: Theme.of(context).colorScheme.onTertiary,
              icon: Icons.edit_sharp,
              label: 'Editar',
            ),
          ],
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            tileColor:
                Theme.of(context).colorScheme.surfaceVariant.withAlpha(50),
            selectedTileColor: Theme.of(context).colorScheme.surfaceVariant,
            leading: const Icon(Icons.location_on_sharp, size: 30),
            title: widget.addressViewModel.buildAddressTitle(address),
            subtitle: widget.addressViewModel.buildAddressSubtitle(address),
            selected: address == currentSelectedAddress,
            onTap: () {
              widget.addressViewModel.selectDeliveryAddress(address);
            },
            trailing: Radio(
              value: index,
              groupValue: userAddresses.indexOf(currentSelectedAddress!),
              onChanged: (value) {
                widget.addressViewModel.selectDeliveryAddress(address);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AddressManagementHeaderButtons extends ConsumerWidget {
  const AddressManagementHeaderButtons({
    super.key,
    required this.addressViewModel,
  });

  final AddressViewModel addressViewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return addressViewModel.getCurrentLocationAddress().when(
          data: (currentLocation) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    onPressed: () {
                      addressViewModel.onUseCurrentAddressTap(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_sharp,
                            color: Theme.of(context).colorScheme.onTertiary),
                        const SizedBox(width: 8), // Use SizedBox instead of Gap
                        Text(
                          'Usar minha localização atual',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8,
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Ajuda'),
                                  titleTextStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                  content: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Se você está em um local diferente do seu endereço cadastrado, você pode usar sua localização atual ou pesquisar um novo endereço e adiciona-lo. ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nDeslize para os lados para editar ou deletar um endereço.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                        ),
                                      ],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok')),
                                  ],
                                );
                              });
                        },
                        icon: Icon(
                          Icons.help_outline_sharp,
                          color: Theme.of(context).colorScheme.tertiary,
                        )),
                  ),
                ],
              ),
            );
          },
          loading: () => const LoadingWidget(),
          error: (error, stackTrace) => const ElevatedButton(
            onPressed: null,
            child: Text('Houve um erro ao buscar sua localização atual'),
          ),
        );
  }
}
