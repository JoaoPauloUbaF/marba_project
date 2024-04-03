import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_category_selection_field_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_image_selection_field.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_selection_widget.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../../core/models/service/enums.dart';

final formKey = GlobalKey<FormState>();

class CreateOfferStepperWidget extends ConsumerStatefulWidget {
  const CreateOfferStepperWidget({super.key});

  @override
  CreateOfferStepperWidgetState createState() =>
      CreateOfferStepperWidgetState();
}

class CreateOfferStepperWidgetState
    extends ConsumerState<CreateOfferStepperWidget> {
  late TextEditingController _offerTitleController;
  late TextEditingController _offerDescriptionController;
  late MoneyMaskedTextController _offerPriceController;
  late TextEditingController _offerAvailableQuantityController;
  late MoneyMaskedTextController _offerItemCostController;
  late OfferType? _offerTypeController;
  late Set<String> _offerCategory;
  late File? _offerImage;
  late List<File?> _offerMedia;
  late OfferStatus? _offerStatus;
  late ServicePricingType? _servicePricingType;

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _offerTitleController = TextEditingController();
    _offerDescriptionController = TextEditingController();
    _offerImage = null;
    _offerMedia = [];
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
    _offerTypeController = null;
    _servicePricingType = ServicePricingType.fixed;
  }

  @override
  void dispose() {
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
          _offerTypeController == OfferType.product
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
          _offerTypeController == OfferType.service
              ? DropdownButtonFormField<ServicePricingType>(
                  value: _servicePricingType,
                  decoration: const InputDecoration(
                    labelText: 'Cobrança do serviço',
                  ),
                  items: ServicePricingType.values
                      .map((ServicePricingType status) {
                    return DropdownMenuItem<ServicePricingType>(
                      value: status,
                      child: Text(servicePricingTypeTranslations[status] ??
                          status.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: (ServicePricingType? newValue) {
                    setState(() {
                      _servicePricingType = newValue;
                    });
                  },
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 8.0),
          OfferCategorySelectionFieldWidget(
            offerType: _offerTypeController ?? OfferType.product,
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
              _offerTypeController = value;
            });
          },
        ),
      ),
      Step(
        title: const Text('Dados da oferta'),
        content: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Imagem principal da oferta',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            OfferImageField(
              onImageSelected: (value) => setState(() {
                _offerImage = value;
              }),
              offerCreationController: offerCreationController,
            ),
            TextButton.icon(
              onPressed: () {
                offerCreationController.pickMoreOfferMedia().then(
                  (value) {
                    setState(
                      () {
                        _offerMedia = value;
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.image_sharp),
              label: const Text('Adicionar mais mídias'),
            ),
            const SizedBox(height: 8.0),
            if (_offerMedia.isNotEmpty)
              OfferMediaWidget(
                offerMedia: _offerMedia,
                onMediaRemoved: () {
                  setState(() {});
                },
              ),
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
        controlsBuilder: (context, details) => Row(
          children: [
            details.currentStep != 0
                ? IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: details.onStepCancel,
                    icon: const Icon(Icons.arrow_back_rounded),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            details.currentStep != steps.length - 1
                ? IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: _offerTypeController != null
                        ? details.onStepContinue
                        : null,
                    icon: const Icon(Icons.arrow_forward_rounded),
                  )
                : const SizedBox.shrink(),
            details.currentStep == steps.length - 1
                ? TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        offerCreationController.showLoadingDialog(context);
                        offerCreationController
                            .submitOfferCreationForm(
                              offerType: _offerTypeController!,
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
                              offerMedia: _offerMedia,
                              servicePricingType: _servicePricingType,
                            )
                            .then(
                              (value) => {
                                Navigator.of(context).pop(),
                                offerCreationController.showSuccessDialog(
                                    context, value),
                              },
                            );
                      } else {
                        offerCreationController.showFormErrorDialog(context);
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class OfferMediaWidget extends StatelessWidget {
  const OfferMediaWidget({
    super.key,
    required this.offerMedia,
    required this.onMediaRemoved,
  });

  final List<File?> offerMedia;
  final Function() onMediaRemoved;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          items: offerMedia.map(
            (i) {
              return InkWell(
                child: SizedBox(
                  child: Stack(
                    children: [
                      Image.file(
                        i!,
                        fit: BoxFit.fill,
                        height: 100,
                        width: 200,
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: InkWell(
                          onTap: () {
                            offerMedia.remove(i);
                            onMediaRemoved();
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 16,
                            shadows: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 0.4,
            enableInfiniteScroll: false,
          ),
        ),
      ),
    );
  }
}
