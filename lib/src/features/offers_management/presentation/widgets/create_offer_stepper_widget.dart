import 'dart:io';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_category_selection_field_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_image_selection_field.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_selection_widget.dart';

import '../../../../shared/models/offer/offer_model.dart';

final formKey = GlobalKey<FormState>();

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
  late MoneyMaskedTextController _offerPriceController;
  late TextEditingController _offerAvailableQuantityController;
  late MoneyMaskedTextController _offerItemCostController;
  late Set<String> _offerCategory;
  late File? _offerImage;
  late OfferStatus? _offerStatus;

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _offerTypeController = TextEditingController();
    _offerTitleController = TextEditingController();
    _offerDescriptionController = TextEditingController();
    _offerImage = null;
    _offerStatus = OfferStatus.active;
    _offerAvailableQuantityController = MaskedTextController(
      mask: '00000',
    );
    _offerPriceController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    _offerItemCostController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    _offerCategory = {};
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

    Column buildOfferInfoField(
        OfferCreationController offerCreationController) {
      return Column(
        children: [
          TextFormField(
            controller: _offerTitleController,
            decoration: const InputDecoration(
              labelText: 'Nome da oferta',
            ),
            validator: (value) => offerCreationController.validateTitle(value),
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
            validator: (value) => offerCreationController.validatePrice(value),
          ),
          _offerTypeController.text == 'product'
              ? TextFormField(
                  controller: _offerAvailableQuantityController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade disponível',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      offerCreationController.validateAvailableQuantity(value),
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
          const SizedBox(height: 8.0),
          OfferCategorySelectionFieldWidget(
            offerType: _offerTypeController.text,
            offerCategory: _offerCategory,
            onCategorySelected: (category, value) {
              setState(() {
                if (_offerCategory.contains(category)) {
                  _offerCategory.remove(category);
                } else {
                  _offerCategory.add(category);
                }
              });
            },
          ),
        ],
      );
    }

    List<Step> steps = [
      Step(
        title: const Text('Sua oferta é um produto ou serviço?'),
        content: OfferTypeSelection(
          onTypeSelected: (value) {
            setState(() {
              _offerTypeController.text = value;
            });
          },
        ),
      ),
      Step(
        title: const Text('Dados da oferta'),
        content: Column(
          children: [
            OfferImageField(offerCreationController: offerCreationController),
            buildOfferInfoField(offerCreationController),
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
                    onPressed: _offerTypeController.text.isNotEmpty
                        ? details.onStepContinue
                        : null,
                    icon: const Icon(Icons.arrow_forward_rounded),
                  )
                : const SizedBox.shrink(),
            details.currentStep == steps.length - 1
                ? TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        offerCreationController
                            .submitOfferCreationForm(
                              offerType: _offerTypeController.text,
                              offerTitle: _offerTitleController.text,
                              offerDescription:
                                  _offerDescriptionController.text,
                              offerPrice: _offerPriceController.text,
                              offerAvailableQuantity:
                                  _offerAvailableQuantityController.text,
                              offerItemCost: _offerItemCostController.text,
                              offerCategory: _offerCategory,
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
                  )
                : const SizedBox.shrink(),
          ],
        ),
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          } else {
            Navigator.of(context).pop();
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
