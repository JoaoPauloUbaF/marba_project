import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/utils/registration_utils.dart';
import '../../../../core/widgets/medium_vertical_space_widget.dart';
import '../../application/address_view_model/address_view_model.dart';

class AddressFormModalWidget extends ConsumerStatefulWidget {
  final String title;

  final Address? currentAddress;
  final String? businessId;

  const AddressFormModalWidget({
    super.key,
    required this.currentAddress,
    required this.title,
    this.businessId,
  });

  @override
  ConsumerState<AddressFormModalWidget> createState() =>
      _AddressFormModalWidgetState();
}

class _AddressFormModalWidgetState
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
    final _ = ref.watch(addressViewModelProvider);
    final viewModel = ref.read(addressViewModelProvider.notifier);
    final validator = viewModel.validator;

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
                    viewModel.saveOrUpdateAddress(
                      context: context,
                      formKey: formKey,
                      street: streetController.text,
                      number: numberController.text,
                      zipCode: zipCodeController.text,
                      neighborhood: neighborhoodController.text,
                      city: cityController.text,
                      state: stateController.text,
                      currentAddress: widget.currentAddress,
                      businessId: widget.businessId,
                    );
                  },
                  child: Text(widget.title),
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
