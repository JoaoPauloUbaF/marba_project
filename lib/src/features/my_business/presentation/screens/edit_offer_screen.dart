import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/features/offers_management/application/offer_edition/offer_edition_controller.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_image_selection_field.dart';

import '../../../../shared/models/offer/offer_model.dart'; // Import your offer model

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
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _availableQuantityController =
      TextEditingController();
  final TextEditingController _itemCostController = TextEditingController();
  String _category = '';
  String _status = '';
  File? _image;
  String? _imageURl;

  @override
  void initState() {
    final offerEditionController = ref.read(offerEditionControllerProvider);
    super.initState();
    // Initialize the text field controllers with the offer's data
    _titleController.text =
        offerEditionController?.title ?? 'Houve um problema';
    _descriptionController.text =
        offerEditionController?.description ?? 'Houve um problema';
    _priceController.text = offerEditionController?.price.toString() ?? '';
    _availableQuantityController.text =
        offerEditionController!.availableQuantity.toString();
    _itemCostController.text = offerEditionController.itemCost.toString();
    _category = offerEditionController.category;
    _status = offerEditionController.status.toString();
    _imageURl = offerEditionController.imageUrl;
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Offer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferImageField(
              onImageSelected: (value) => setState(() {
                _image = value;
              }),
              offerCreationController: offerCreationController,
              imageURL: _imageURl,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            TextFormField(
              controller: _availableQuantityController,
              decoration:
                  const InputDecoration(labelText: 'Available Quantity'),
            ),
            TextFormField(
              controller: _itemCostController,
              decoration: const InputDecoration(labelText: 'Item Cost'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
