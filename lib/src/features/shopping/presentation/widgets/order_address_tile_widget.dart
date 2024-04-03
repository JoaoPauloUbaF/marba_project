import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/presentation/widgets/loading_widget.dart';
import 'package:project_marba/src/features/location_management/application/user_address_list_provider/user_address_list_provider.dart';
import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/order_address_tile_content_widget.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/order_address_to_sign_in_widget.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

import '../../../../core/utils/registration_utils.dart';
import '../../../user_profile/application/profile_forms_controller/profile_forms_screen_controller.dart';

class OrderAddressTileWidget extends ConsumerWidget {
  const OrderAddressTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAddress = ref.watch(deliveryAddressProvider);
    ref.read(userAddressListProvider);
    return ref.read(userAddressListProvider).when(
          data: (address) {
            if (address.first == null) {
              return const OrderAddressToSignInWidget();
            }
            return OrderAddressTileContentWidget(address: address.first);
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Erro: $error'),
        );
  }
}

class AddressFormModalWidget extends ConsumerStatefulWidget {
  final String title;

  final Address? currentAddress;

  const AddressFormModalWidget({
    super.key,
    required this.currentAddress,
    required this.title,
  });

  @override
  ConsumerState<AddressFormModalWidget> createState() =>
      _AddNewAddressModalWidgetState();
}

class _AddNewAddressModalWidgetState
    extends ConsumerState<AddressFormModalWidget> {
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = MaskedTextController(mask: '00000');
  TextEditingController zipCodeController =
      MaskedTextController(mask: '00000-000');
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.currentAddress != null) {
      streetController =
          TextEditingController(text: widget.currentAddress?.street ?? '');
      numberController = MaskedTextController(
          mask: '00000', text: widget.currentAddress?.number ?? '');
      zipCodeController = MaskedTextController(
          mask: '00000-000', text: widget.currentAddress?.zipCode ?? '');
      neighborhoodController = TextEditingController(
          text: widget.currentAddress?.neighborhood ?? '');
      cityController =
          TextEditingController(text: widget.currentAddress?.city ?? '');
      stateController =
          TextEditingController(text: widget.currentAddress?.state ?? '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final validator = ref.read(profileFormsScreenControllerProvider.notifier);
    return SizedBox(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                const VerticalSpaceMediumWidget(),
                const VerticalSpaceMediumWidget(),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const VerticalSpaceMediumWidget(),
                const VerticalSpaceMediumWidget(),
                const VerticalSpaceMediumWidget(),
                TextFormField(
                  controller: zipCodeController,
                  validator: (value) => validator.validateZipCode(value),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    border: OutlineInputBorder(gapPadding: 0.0),
                    labelText: 'CEP',
                  ),
                ),
                const VerticalSpaceMediumWidget(),
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    border: OutlineInputBorder(gapPadding: 0.0),
                    labelText: 'Rua',
                  ),
                  validator: (value) => validator.validateAddressStreet(value),
                  controller: streetController,
                ),
                const VerticalSpaceMediumWidget(),
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                    ),
                    labelText: 'Número',
                  ),
                  validator: (value) => validator.validateAddressNumber(value),
                  controller: numberController,
                ),
                const VerticalSpaceMediumWidget(),
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                    ),
                    labelText: 'Bairro',
                  ),
                  validator: (value) => validator.validateNeighborhood(value),
                  onEditingComplete: () => validator,
                  controller: neighborhoodController,
                ),
                const VerticalSpaceMediumWidget(),
                const VerticalSpaceMediumWidget(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        menuMaxHeight:
                            MediaQuery.of(context).size.height * 0.45,
                        value: RegistrationUtils().getCitiesList().first.value,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          border: OutlineInputBorder(),
                          labelText: 'Cidade',
                        ),
                        items: RegistrationUtils().getCitiesList(),
                        onChanged: (String? newValue) {
                          cityController.text = newValue ?? '';
                        },
                        validator: (value) => validator.validateCity(value),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        menuMaxHeight:
                            MediaQuery.of(context).size.height * 0.45,
                        value: RegistrationUtils().getStatesList().first.value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          labelText: 'Estado',
                        ),
                        items: RegistrationUtils().getStatesList(),
                        onChanged: (String? newValue) {
                          stateController.text = newValue ?? '';
                        },
                        validator: (value) => validator.validateState(value),
                      ),
                    ),
                  ],
                ),
                const VerticalSpaceMediumWidget(),
                const VerticalSpaceMediumWidget(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var user = ref.read(currentUserProvider);

                      user.when(
                        data: (user) {
                          if (user == null) {
                            return;
                          }
                          ref
                              .read(
                                  userProfileDataProvider) //TODO: move to location management
                              .addDeliveryAddress(uid: user.id, address: {
                            'street': streetController.text,
                            'number': numberController.text,
                            'zipCode': zipCodeController.text,
                            'neighborhood': neighborhoodController.text,
                            'city': cityController.text,
                            'state': stateController.text,
                          }).then(
                            (value) => showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Center(child: Text('Sucesso')),
                                content: const Text(
                                    'Endereço adicionado com sucesso'),
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
                                      ))
                              .then((value) => Navigator.of(context).pop());
                        },
                      );
                    }
                  },
                  child: Text(
                    widget.currentAddress != null
                        ? 'Atualizar endereço'
                        : 'Adicionar endereço',
                  ),
                ),
                const VerticalSpaceMediumWidget(),
                const VerticalSpaceMediumWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
