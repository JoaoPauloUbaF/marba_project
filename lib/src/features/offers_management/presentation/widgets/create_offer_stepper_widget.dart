import 'dart:io';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/shared/models/product/product.dart';
import 'package:project_marba/src/shared/models/service/service.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/models/offer/offer_model.dart';
import '../../../my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

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

  int _currentStep = 0;
  OfferStatus? _offerStatus;

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
  }

  @override
  void dispose() {
    _offerTypeController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final business = ref.read(businessProfileScreenControllerProvider)!;
    final offerId = Uuid().v4();
    String? offerImageUrl;
    try {
      offerImageUrl = await ref
          .read(offerRepositoryProviderProvider)
          .saveOfferImage(_offerImage!, offerId);
    } catch (e) {
      print('Error uploading image: $e');
      return;
    }

    if (_offerTypeController.text == 'product') {
      var offerProduct = Product(
        title: _offerTitleController.text,
        description: _offerDescriptionController.text,
        price: currencyStringToDouble(_offerPriceController.text),
        imageUrl: offerImageUrl ?? '',
        availableQuantity: int.parse(_offerAvailableQuantityController.text),
        itemCost: currencyStringToDouble(_offerItemCostController.text),
        status: _offerStatus.toString(),
      );
      final offer = OfferModel(
        id: offerId, // Generate or provide ID
        businessId: business.id, // Provide business ID
        category: _offerTypeController.text,
        product: offerProduct,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        status: _offerStatus ?? OfferStatus.active,
      );
      print('Created offer: $offer');
      ref.read(offerRepositoryProviderProvider).createOffer(offer);
    }

    if (_offerTypeController.text == 'service') {
      final service = Service(
          title: _offerTitleController.text,
          description: _offerDescriptionController.text,
          price: currencyStringToDouble(_offerPriceController.text),
          imageUrl: offerImageUrl ?? '',
          status: _offerStatus.toString());
      final offer = OfferModel(
        id: offerId, // Generate or provide ID
        businessId: business.id, // Provide business ID
        category: _offerTypeController.text,
        service: service,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        status: _offerStatus ?? OfferStatus.active,
      );
      print('Created offer: $offer');
      ref.read(offerRepositoryProviderProvider).createOffer(offer);
    }

    Navigator.of(context).pop();
  }

  double currencyStringToDouble(String currencyString) {
    currencyString = currencyString.replaceAll('R\$ ', '');
    currencyString = currencyString.replaceAll('.', '');
    currencyString = currencyString.replaceAll(',', '.');
    return double.parse(currencyString);
  }

  Map<String, String> get statusTranslations => {
        'active': 'Disponível',
        'inactive': 'Indisponível',
        'pending': 'Pendente',
        'soldOut': 'Esgotado',
        'onDemand': 'Sob Encomenda',
      };

  @override
  Widget build(BuildContext context) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);

    List<Step> steps = [
      Step(
        title: const Text('Sua oferta é um produto ou serviço?'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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
            InkWell(
              onTap: () => offerCreationController
                  .pickNewOfferImage()
                  .then((value) => setState(() {
                        _offerImage = value;
                      })),
              child: _offerImage != null
                  ? Image.file(
                      _offerImage!,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fill,
                    )
                  : const Icon(Icons.add_a_photo_sharp, size: 100),
            ),
            TextFormField(
              controller: _offerTitleController,
              decoration: const InputDecoration(
                labelText: 'Nome da oferta',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o nome da oferta';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _offerDescriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha a descrição';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _offerPriceController,
              decoration: const InputDecoration(
                labelText: 'Preço',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o preço';
                }
                return null;
              },
            ),
            _offerTypeController.text == 'product'
                ? TextFormField(
                    controller: _offerAvailableQuantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantidade disponível',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha a quantidade disponível';
                      }
                      return null;
                    },
                  )
                : const SizedBox.shrink(),
            TextFormField(
              controller: _offerItemCostController,
              decoration: const InputDecoration(
                labelText: 'Custo',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o custo';
                }
                return null;
              },
            ),
            DropdownButtonFormField<OfferStatus>(
              value: _offerStatus,
              decoration: const InputDecoration(
                labelText: 'Status',
              ),
              items: OfferStatus.values.map((OfferStatus status) {
                return DropdownMenuItem<OfferStatus>(
                  value: status,
                  child: Text(
                      statusTranslations[status.toString().split('.').last] ??
                          status.toString().split('.').last),
                );
              }).toList(),
              onChanged: (OfferStatus? newValue) {
                setState(() {
                  _offerStatus = newValue;
                });
              },
              validator: (OfferStatus? value) {
                if (value == null) {
                  return 'Por favor, preencha o status';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    ];

    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        controlsBuilder: (context, details) => Row(
          children: [
            if (_currentStep > 0)
              IconButton(
                color: Colors.orange,
                onPressed: () {
                  setState(() {
                    _currentStep -= 1;
                  });
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            const Spacer(),
            if (_currentStep < steps.length - 1)
              IconButton(
                color: Colors.orange,
                onPressed: () {
                  if (_currentStep == 0 && _offerTypeController.text.isEmpty) {
                    return;
                  }
                  setState(() {
                    _currentStep += 1;
                  });
                },
                icon: const Icon(Icons.arrow_forward_rounded),
              ),
            if (_currentStep == steps.length - 1)
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _submitForm();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Erro'),
                          content: const Text(
                              'Por favor, preencha todos os campos corretamente.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {});
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
          } else {
            // Reached the last step, submit the form
            _submitForm();
          }
        },
        steps: steps,
      ),
    );
  }
}
