import 'dart:io';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';

import '../../../../shared/models/offer/offer_model.dart';

class CreateOfferStepperWidget extends ConsumerStatefulWidget {
  const CreateOfferStepperWidget({Key? key}) : super(key: key);

  @override
  CreateOfferStepperWidgetState createState() =>
      CreateOfferStepperWidgetState();
}

class CreateOfferStepperWidgetState
    extends ConsumerState<CreateOfferStepperWidget> {
  late TextEditingController _offerTypeController;
  late TextEditingController _offerTitleController;
  late TextEditingController _offerDescriptionController;
  late TextEditingController _offerPriceController;
  late TextEditingController _offerAvailableQuantityController;
  late TextEditingController _offerItemCostController;
  late File? _offerImage;
  late OfferStatus? _offerStatus;

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _offerTypeController = TextEditingController();
    _offerTitleController = TextEditingController();
    _offerDescriptionController = TextEditingController();
    _offerPriceController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    _offerAvailableQuantityController = TextEditingController();
    _offerItemCostController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    _offerImage = null;
    _offerStatus = OfferStatus.active;
  }

  @override
  void dispose() {
    _offerTypeController.dispose();
    _offerTitleController.dispose();
    _offerDescriptionController.dispose();
    _offerPriceController.dispose();
    _offerAvailableQuantityController.dispose();
    _offerItemCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);
    final formKey = GlobalKey<FormState>();

    List<Step> steps = [
      Step(
        title: const Text('Sua oferta é um produto ou serviço?'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart_sharp,
                        color: _offerTypeController.text == 'product'
                            ? Colors.orange
                            : Colors.grey,
                        size: 50, // Change colors as needed
                      ),
                      onPressed: () {
                        setState(() {
                          _offerTypeController.text = 'product';
                        });
                      },
                    ),
                  ],
                ),
                const Text('Produto'),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.build_sharp,
                    color: _offerTypeController.text == 'service'
                        ? Colors.orange
                        : Colors.grey,
                    size: 50, // Change colors as needed
                  ),
                  onPressed: () {
                    setState(() {
                      _offerTypeController.text = 'service';
                    });
                  },
                ),
                const Text('Serviço'),
              ],
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Dados da oferta'),
        content: Column(
          children: [
            FormField(
              validator: (value) => offerCreationController.validateImageUrl(
                _offerImage?.path,
              ),
              builder: (FormFieldState<dynamic> field) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () => offerCreationController
                          .pickNewOfferImage()
                          .then((value) => setState(() {
                                _offerImage = value;
                              })),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: _offerImage != null
                            ? Image.file(
                                _offerImage!,
                                fit: BoxFit.fill,
                              )
                            : const Icon(
                                Icons.add_a_photo_sharp,
                                size: 100,
                              ),
                      ),
                    ),
                    field.errorText != null
                        ? Text(
                            field.errorText.toString(),
                            style:
                                TextStyle(color: ThemeData().colorScheme.error),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              },
            ),
            TextFormField(
              controller: _offerTitleController,
              decoration: const InputDecoration(
                labelText: 'Nome da oferta',
              ),
              validator: (value) =>
                  offerCreationController.validateTitle(value),
            ),
            TextFormField(
              controller: _offerDescriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
              validator: (value) =>
                  offerCreationController.validateDescription(value),
            ),
            TextFormField(
              controller: _offerPriceController,
              decoration: const InputDecoration(
                labelText: 'Preço',
              ),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  offerCreationController.validatePrice(value),
            ),
            _offerTypeController.text == 'product'
                ? TextFormField(
                    controller: _offerAvailableQuantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantidade disponível',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) => offerCreationController
                        .validateAvailableQuantity(value),
                  )
                : const SizedBox.shrink(),
            TextFormField(
              controller: _offerItemCostController,
              decoration: const InputDecoration(
                labelText: 'Custo',
              ),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  offerCreationController.validateItemCost(value),
            ),
            DropdownButtonFormField<OfferStatus>(
              value: _offerStatus,
              decoration: const InputDecoration(
                labelText: 'Status',
              ),
              items: OfferStatus.values.map((OfferStatus status) {
                return DropdownMenuItem<OfferStatus>(
                  value: status,
                  child: Text(offerCreationController.statusTranslations[
                          status.toString().split('.').last] ??
                      status.toString().split('.').last),
                );
              }).toList(),
              onChanged: (OfferStatus? newValue) {
                setState(() {
                  _offerStatus = newValue;
                });
              },
              validator: (OfferStatus? value) =>
                  offerCreationController.validateStatus(value.toString()),
            ),
          ],
        ),
      ),
    ];

    return Form(
      key: formKey,
      child: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        controlsBuilder: (context, details) => Row(
          children: [
            details.currentStep != 0
                ? IconButton(
                    color: Colors.orange,
                    onPressed: details.onStepCancel,
                    icon: const Icon(Icons.arrow_back_rounded),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            details.currentStep != steps.length - 1
                ? IconButton(
                    color: Colors.orange,
                    onPressed: details.onStepContinue,
                    icon: const Icon(Icons.arrow_forward_rounded),
                  )
                : const SizedBox.shrink(),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  offerCreationController
                      .submitOfferCreationForm(
                        offerType: _offerTypeController.text,
                        offerTitle: _offerTitleController.text,
                        offerDescription: _offerDescriptionController.text,
                        offerPrice: _offerPriceController.text,
                        offerAvailableQuantity:
                            _offerAvailableQuantityController.text,
                        offerItemCost: _offerItemCostController.text,
                        offerCategory: _offerTypeController.text,
                        offerStatus: _offerStatus,
                        offerImage: _offerImage,
                      )
                      .then((value) => Navigator.of(context).pop());
                }
              },
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_currentStep < steps.length - 1) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        steps: steps,
      ),
    );
  }
}
