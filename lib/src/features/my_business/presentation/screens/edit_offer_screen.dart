import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/features/offers_management/application/offer_edition/offer_edition_controller.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_image_selection_field.dart';

import '../../../../shared/models/offer/offer_model.dart';
import '../../../offers_management/presentation/widgets/offer_category_selection_field_widget.dart'; // Import your offer model

class EditOfferScreen extends ConsumerStatefulWidget {
  const EditOfferScreen({
    super.key,
  });

  @override
  EditOfferScreenState createState() => EditOfferScreenState();
}

class EditOfferScreenState extends ConsumerState<EditOfferScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _availableQuantityController =
      TextEditingController();
  final TextEditingController _priceController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    precision: 2,
    decimalSeparator: ',',
  );
  final TextEditingController _itemCostController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    precision: 2,
    decimalSeparator: ',',
  );
  final Set<String> _offerCategory = {};
  OfferStatus? _status;
  File? _image;
  String? _imageURl;

  @override
  void initState() {
    final offerEditionController = ref.read(offerEditionControllerProvider);
    super.initState();
    _titleController.text =
        offerEditionController?.title ?? 'Houve um problema';
    _descriptionController.text =
        offerEditionController?.description ?? 'Houve um problema';
    _priceController.text = offerEditionController?.price.toString() ?? '';
    _availableQuantityController.text =
        offerEditionController?.availableQuantity.toString() ?? '';
    _itemCostController.text =
        offerEditionController?.itemCost?.toString() ?? '0,00';
    _offerCategory.addAll(offerEditionController?.category ?? {});
    _status = offerEditionController?.status ?? OfferStatus.active;
    _imageURl = offerEditionController?.imageUrl;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _availableQuantityController.dispose();
    _priceController.dispose();
    _itemCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);
    final offerEditionController = ref.read(offerEditionControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferImageField(
              imageURL: _imageURl,
              onImageSelected: (value) => setState(() {
                _image = value;
              }),
              offerCreationController: offerCreationController,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
              maxLines: null,
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Preço'),
            ),
            offerEditionController?.availableQuantity != null
                ? TextFormField(
                    controller: _availableQuantityController,
                    decoration: const InputDecoration(
                        labelText: 'Quantidade disponível'),
                  )
                : const SizedBox.shrink(),
            offerEditionController?.itemCost != null
                ? TextFormField(
                    controller: _itemCostController,
                    decoration: const InputDecoration(labelText: 'Custo'),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<OfferStatus>(
              value: _status,
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
                  _status = newValue;
                });
              },
              validator: (OfferStatus? value) =>
                  offerCreationController.validateStatus(value.toString()),
            ),
            const SizedBox(height: 16.0),
            OfferCategorySelectionFieldWidget(
              offerType: offerEditionController!.type,
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
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(offerEditionControllerProvider.notifier)
                        .validateAndSubmitOfferUpdate(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          price: _priceController.text,
                          availableQuantity: _availableQuantityController.text,
                          itemCost: _itemCostController.text,
                          status: _status,
                          category: _offerCategory,
                          image: _image,
                          type: offerEditionController.type,
                        )
                        .then(
                          (value) => showGeneralDialog(
                            context: context,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return AlertDialog(
                                title: Text('Sua oferta foi editada!'),
                                content: Text(value),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
