import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project_marba/src/features/business/application/business_creation_controller/business_creation_controller.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_address_form_field_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_info_form_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/category_form_field_widget.dart';

import '../../../../shared/models/business/enums.dart';

class CreateBusinessStepperWidget extends ConsumerStatefulWidget {
  const CreateBusinessStepperWidget({super.key});
  @override
  AddBusinessStepperWidgetState createState() =>
      AddBusinessStepperWidgetState();
}

class AddBusinessStepperWidgetState
    extends ConsumerState<CreateBusinessStepperWidget> {
  late final List<GlobalKey<FormState>> formKeys;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _streetController;
  late TextEditingController _numberController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipCodeController;
  late Set<BusinessCategory> _selectedCategories;
  late BusinessCreationController businessCreationController;

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = MaskedTextController(mask: '(00) 00000-0000');
    _streetController = TextEditingController();
    _numberController = MaskedTextController(mask: '00000');
    _neighborhoodController = TextEditingController();
    _cityController = TextEditingController(text: "Lavras");
    _stateController = TextEditingController(text: "MG");
    _zipCodeController = MaskedTextController(mask: '00000-000');
    _selectedCategories = {};
    formKeys = List.generate(3, (_) => GlobalKey<FormState>());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _neighborhoodController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    businessCreationController
        .submitForm(
          name: _nameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          street: _streetController.text,
          number: _numberController.text,
          neighborhood: _neighborhoodController.text,
          city: _cityController.text,
          state: _stateController.text,
          zipCode: _zipCodeController.text,
          selectedCategories: _selectedCategories,
        )
        .then(
          (value) => {
            Navigator.of(context).pop(),
            businessCreationController.showSuccessDialog(
                context, _nameController.text),
          },
        );
  }

  List<Step> get steps {
    return [
      Step(
        title: const Text('Informações básicas'),
        content: BusinessInfoFormWidget(
          formKeys: formKeys,
          nameController: _nameController,
          businessCreationController: businessCreationController,
          emailController: _emailController,
          phoneController: _phoneController,
          onChanged: () => setState(() {}),
        ),
      ),
      Step(
        title: const Text('Endereço'),
        content: BusinessAddressFormFieldWidget(
            formKeys: formKeys,
            zipCodeController: _zipCodeController,
            businessCreationController: businessCreationController,
            streetController: _streetController,
            numberController: _numberController,
            neighborhoodController: _neighborhoodController,
            cityController: _cityController,
            context: context,
            stateController: _stateController,
            onChanged: () => setState(() {})),
      ),
      Step(
        title: const Text('Categorias'),
        content: CategoryFormFieldWidget(
            formKeys: formKeys,
            currentStep: _currentStep,
            selectedCategories: _selectedCategories,
            context: context,
            businessCreationController: businessCreationController),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    businessCreationController =
        ref.read(businessCreationControllerProvider.notifier);

    return Stepper(
      type: StepperType.vertical,
      currentStep: _currentStep,
      controlsBuilder: (context, details) => Row(
        children: [
          Visibility(
            visible: details.currentStep != 0,
            child: IconButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed: details.onStepCancel,
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          const Spacer(),
          Visibility(
            visible: details.currentStep != steps.length - 1,
            child: IconButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed:
                  (formKeys[_currentStep].currentState?.validate() ?? false)
                      ? details.onStepContinue
                      : null,
              icon: const Icon(Icons.arrow_forward_rounded),
            ),
          ),
          Visibility(
            visible: details.currentStep == steps.length - 1,
            child: TextButton(
              onPressed: () {
                if (formKeys[_currentStep].currentState?.validate() ?? false) {
                  businessCreationController.showLoadingDialog(context);
                  _submitForm();
                } else {
                  businessCreationController.showMissingFieldsDialog(context);
                }
              },
              child: Text(
                'Salvar',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
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
        if (_currentStep <= steps.length - 1) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      steps: steps,
    );
  }
}