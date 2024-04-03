import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_creation_controller/business_creation_controller.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';

class BusinessAddressFormFieldWidget extends StatelessWidget {
  const BusinessAddressFormFieldWidget({
    super.key,
    required this.formKeys,
    required this.zipCodeController,
    required this.businessCreationController,
    required this.streetController,
    required this.numberController,
    required this.neighborhoodController,
    required this.cityController,
    required this.context,
    required this.stateController,
    required this.onChanged,
  });

  final List<GlobalKey<FormState>> formKeys;
  final TextEditingController zipCodeController;
  final BusinessCreationController businessCreationController;
  final TextEditingController streetController;
  final TextEditingController numberController;
  final TextEditingController neighborhoodController;
  final TextEditingController cityController;
  final BuildContext context;
  final TextEditingController stateController;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: onChanged,
      key: formKeys[1],
      child: Column(
        children: [
          TextFormField(
            controller: zipCodeController,
            decoration: const InputDecoration(labelText: 'CEP'),
            validator: (value) =>
                businessCreationController.validateZipCode(value),
          ),
          TextFormField(
            controller: streetController,
            decoration: const InputDecoration(labelText: 'Rua'),
            validator: (value) =>
                businessCreationController.validateAddressStreet(value),
          ),
          TextFormField(
            controller: numberController,
            decoration: const InputDecoration(labelText: 'Número'),
            validator: (value) =>
                businessCreationController.validateAddressNumber(value),
          ),
          TextFormField(
            controller: neighborhoodController,
            decoration: const InputDecoration(labelText: 'Bairro'),
            validator: (value) =>
                businessCreationController.validateNeighborhood(value),
          ),
          TextFormField(
            controller: cityController,
            decoration: const InputDecoration(labelText: 'Cidade'),
            validator: (value) =>
                businessCreationController.validateCity(value),
          ),
          DropdownButtonFormField<String>(
            menuMaxHeight: MediaQuery.of(context).size.height * 0.45,
            value: stateController.text.isEmpty ? null : stateController.text,
            decoration: const InputDecoration(labelText: 'Estado'),
            items: RegistrationUtils().getStatesList(),
            onChanged: (String? newValue) {
              stateController.text = newValue ?? '';
            },
            validator: (value) =>
                businessCreationController.validateState(value),
          ),
        ],
      ),
    );
  }
}
