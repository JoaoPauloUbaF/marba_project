import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project_marba/src/features/business_profile/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

import 'business_category_cards_widget.dart';

class AddBusinessStepperWidget extends StatefulWidget {
  const AddBusinessStepperWidget(
      {Key? key, required this.myBusinessListController, required this.formKey})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final MyBusinessListScreenController myBusinessListController;

  @override
  _AddBusinessStepperWidgetState createState() =>
      _AddBusinessStepperWidgetState();
}

class _AddBusinessStepperWidgetState extends State<AddBusinessStepperWidget> {
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
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _zipCodeController = MaskedTextController(mask: '00000-000');
    _selectedCategories = {};
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
    widget.myBusinessListController.validateAndSubmitForm(
      key: widget.formKey,
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
    );

    Navigator.of(context).pop();
  }

  List<Step> get steps {
    return [
      Step(
        title: const Text('Informações básicas'),
        content: Form(
          key: widget.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    widget.myBusinessListController.validateName(value),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                // validator: (value) => widget.myBusinessListController.validateEmail(value), TODO: Add email validation
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                validator: (value) =>
                    widget.myBusinessListController.validatePhoneNumber(value),
              ),
            ],
          ),
        ),
      ),
      Step(
        title: const Text('Endereço'),
        content: Form(
          key: widget.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _streetController,
                decoration: const InputDecoration(labelText: 'Rua'),
                validator: (value) => widget.myBusinessListController
                    .validateAddressStreet(value),
              ),
              TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) => widget.myBusinessListController
                    .validateAddressNumber(value),
              ),
              TextFormField(
                controller: _neighborhoodController,
                decoration: const InputDecoration(labelText: 'Bairro'),
                validator: (value) =>
                    widget.myBusinessListController.validateNeighborhood(value),
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) =>
                    widget.myBusinessListController.validateCity(value),
              ),
              TextFormField(
                controller: _stateController,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) =>
                    widget.myBusinessListController.validateState(value),
              ),
              TextFormField(
                controller: _zipCodeController,
                decoration: const InputDecoration(labelText: 'CEP'),
                validator: (value) =>
                    widget.myBusinessListController.validateZipCode(value),
              ),
            ],
          ),
        ),
      ),
      Step(
        title: const Text('Categorias'),
        content: BusinessCategoryCards(selectedCategories: _selectedCategories),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.vertical,
      currentStep: _currentStep,
      controlsBuilder: (context, details) => Row(
        children: [
          if (_currentStep < steps.length - 1)
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStep += 1;
                });
              },
              child: const Text('Proximo'),
            ),
          if (_currentStep > 0 && _currentStep < steps.length - 1)
            TextButton(
              onPressed: () {
                setState(() {
                  _currentStep -= 1;
                });
              },
              child: const Text('Voltar'),
            ),
          if (_currentStep == steps.length - 1)
            TextButton(
              onPressed: () {
                _submitForm();
              },
              child: const Text('Salvar'),
            ),
        ],
      ),
      onStepCancel: () {
        if (_currentStep > 0) {
          Navigator.of(context).pop();
        }
      },
      onStepContinue: () {
        if (_currentStep <= 0) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _currentStep = index;
        });
      },
      steps: steps,
    );
  }
}
