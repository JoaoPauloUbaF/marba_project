import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/business/application/business_creation_view_model/business_creation_view_model.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_search_widget.dart';

import '../../../../../core/models/address/address.dart';

class BusinessAddressFormFieldWidget extends StatefulWidget {
  const BusinessAddressFormFieldWidget({
    super.key,
    required this.formKeys,
    required this.zipCodeController,
    required this.businessCreationController,
    required this.streetController,
    required this.numberController,
    required this.neighborhoodController,
    required this.cityController,
    required this.stateController,
    required this.onChanged,
  });

  final List<GlobalKey<FormState>> formKeys;
  final TextEditingController zipCodeController;
  final BusinessCreationViewModel businessCreationController;
  final TextEditingController streetController;
  final TextEditingController numberController;
  final TextEditingController neighborhoodController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final void Function() onChanged;

  @override
  State<BusinessAddressFormFieldWidget> createState() =>
      _BusinessAddressFormFieldWidgetState();
}

class _BusinessAddressFormFieldWidgetState
    extends State<BusinessAddressFormFieldWidget> {
  bool isControllersFilled() {
    return widget.streetController.text.isNotEmpty &&
        widget.numberController.text.isNotEmpty &&
        widget.neighborhoodController.text.isNotEmpty &&
        widget.cityController.text.isNotEmpty &&
        widget.stateController.text.isNotEmpty &&
        widget.zipCodeController.text.isNotEmpty;
  }

  void clearControllers() {
    setState(() {
      widget.streetController.clear();
      widget.numberController.clear();
      widget.neighborhoodController.clear();
      widget.cityController.clear();
      widget.stateController.clear();
      widget.zipCodeController.clear();
    });
  }

  void onAddressSelected(AddressModel? value) {
    if (value == null) {
      return;
    }
    setState(() {
      widget.zipCodeController.text = value.zipCode;
      widget.streetController.text = value.street;
      widget.numberController.text = value.number ?? '';
      widget.neighborhoodController.text = value.neighborhood;
      widget.cityController.text = value.city;
      widget.stateController.text = value.state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      key: widget.formKeys[1],
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.5,
        child: isControllersFilled()
            ? Column(
                children: [
                  AddressDisplayWidget(
                      address: AddressModel.create(
                        zipCode: widget.zipCodeController.text,
                        street: widget.streetController.text,
                        number: widget.numberController.text,
                        neighborhood: widget.neighborhoodController.text,
                        city: widget.cityController.text,
                        state: widget.stateController.text,
                      ),
                      isEditable: false,
                      isBusinessAddress: false),
                  const Gap(16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        clearControllers();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text('Alterar endereço',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                    ),
                  ),
                ],
              )
            : AddressSearchWidget(
                currentAddress: null,
                onAddressSelected: (value) {
                  onAddressSelected(value);
                },
              ),
      ),
    );
  }
}
