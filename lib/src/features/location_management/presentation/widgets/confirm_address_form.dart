import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/features/location_management/application/address_view_model/address_view_model.dart';

import '../../../../core/models/address/address.dart';

class ConfirmAddressForm extends ConsumerStatefulWidget {
  final AddressModel address;

  const ConfirmAddressForm({super.key, required this.address});

  @override
  ConfirmAddressFormState createState() => ConfirmAddressFormState();
}

class ConfirmAddressFormState extends ConsumerState<ConfirmAddressForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController streetController;
  late TextEditingController numberController;
  late TextEditingController neighborhoodController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController zipCodeController;
  late TextEditingController complementController;
  late TextEditingController nicknameController;

  bool includeNumber = true;
  bool includeComplement = true;

  @override
  void initState() {
    super.initState();
    streetController = TextEditingController(text: widget.address.street);
    numberController = TextEditingController(text: widget.address.number);
    neighborhoodController =
        TextEditingController(text: widget.address.neighborhood);
    cityController = TextEditingController(text: widget.address.city);
    stateController = TextEditingController(text: widget.address.state);
    zipCodeController = TextEditingController(text: widget.address.zipCode);
    complementController = TextEditingController();
    nicknameController = TextEditingController();
  }

  @override
  void dispose() {
    streetController.dispose();
    numberController.dispose();
    neighborhoodController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    complementController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validator = ref.read(inputValidationProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Scrollbar(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(8),
                      TextFormField(
                        controller: streetController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          labelText: 'Rua *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          return validator.validateAddressStreet(value);
                        },
                      ),
                      const Gap(8),
                      CheckboxListTile(
                        title: const Text('Endereço sem número'),
                        value: !includeNumber, // Inverte o valor inicial
                        onChanged: (value) {
                          setState(() {
                            includeNumber = !value!; // Inverte a lógica
                            if (!includeNumber) {
                              numberController.clear();
                            }
                          });
                        },
                      ),
                      if (includeNumber)
                        TextFormField(
                          controller: numberController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            labelText: 'Número *',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            return validator.validateAddressNumber(value);
                          },
                        ),
                      const Gap(8),
                      TextFormField(
                        controller: neighborhoodController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          labelText: 'Bairro *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          return validator.validateAddressNeighborhood(value);
                        },
                      ),
                      const Gap(8),
                      TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          labelText: 'Cidade *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          return validator.validateAddressCity(value);
                        },
                      ),
                      const Gap(8),
                      TextFormField(
                        controller: stateController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          labelText: 'Estado *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          return validator.validateAddressState(value);
                        },
                      ),
                      const Gap(8),
                      TextFormField(
                        controller: zipCodeController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          labelText: 'CEP *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          return validator.validateAddressZipCode(value);
                        },
                      ),
                      const Gap(8),
                      CheckboxListTile(
                        title: Text(
                          'Endereço sem complemento',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        value: !includeComplement, // Inverte o valor inicial
                        onChanged: (value) {
                          setState(() {
                            includeComplement = !value!; // Inverte a lógica
                            if (!includeComplement) {
                              complementController.clear();
                            }
                          });
                        },
                      ),
                      if (includeComplement)
                        TextFormField(
                          controller: complementController,
                          validator: (value) => validator
                              .validateAddressComplement(value, includeNumber),
                          decoration: InputDecoration(
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  overflow: TextOverflow.clip,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                            errorMaxLines: 2,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            labelText: 'Complemento',
                            hintText: 'Ex: Apto 101, Bloco A, etc.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      const Gap(8),
                      TextFormField(
                        controller: nicknameController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          labelText: 'Apelido',
                          hintText: 'Ex: Casa, Trabalho, etc.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newAddress = widget.address.copyWith(
                    street: streetController.text,
                    number: includeNumber ? numberController.text : '',
                    neighborhood: neighborhoodController.text,
                    city: cityController.text,
                    state: stateController.text,
                    zipCode: zipCodeController.text,
                    complement:
                        includeComplement ? complementController.text : null,
                    nickname: nicknameController.text,
                  );
                  Navigator.of(context).pop(newAddress);
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ],
    );
  }
}
