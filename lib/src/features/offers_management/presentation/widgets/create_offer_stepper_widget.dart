import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../shared/models/offer/offer_model.dart';

class CreateOfferStepperWidget extends ConsumerStatefulWidget {
  const CreateOfferStepperWidget({Key? key}) : super(key: key);

  @override
  CreateOfferStepperWidgetState createState() =>
      CreateOfferStepperWidgetState();
}

class CreateOfferStepperWidgetState
    extends ConsumerState<CreateOfferStepperWidget> {
  late TextEditingController _categoryController;
  // You may need more controllers for other fields

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
    // Initialize other controllers if needed
  }

  @override
  void dispose() {
    _categoryController.dispose();
    // Dispose other controllers if needed
    super.dispose();
  }

  void _submitForm() {
    // Process the form data to create an OfferModel instance
    final offer = OfferModel(
      id: 'generated_id', // Generate or provide ID
      businessId: 'your_business_id', // Provide business ID
      category: _categoryController.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      // Assign other properties as needed
    );

    // Handle the created offer, e.g., save to database or send to server
    print('Created offer: $offer');

    // Clear the form or navigate away
    Navigator.of(context).pop();
  }

  List<Step> get steps {
    return [
      Step(
        title: const Text('Basic Information'),
        content: Column(
          children: [
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Category is required';
                }
                return null;
              },
            ),
            // Add more fields here as needed
          ],
        ),
      ),
      // Add more steps as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
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
