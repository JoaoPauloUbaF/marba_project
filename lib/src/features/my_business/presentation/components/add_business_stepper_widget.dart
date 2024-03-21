import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project_marba/src/features/image_picker/presentation/widgets/image_field_widget.dart';
import 'package:project_marba/src/features/my_business/application/business_creation_controller/business_creation_controller.dart';

import '../../../../shared/models/business/enums.dart';
import '../../../../utils/registration_utils.dart';
import 'business_category_cards_widget.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class AddBusinessStepperWidget extends ConsumerStatefulWidget {
  const AddBusinessStepperWidget({super.key});
  @override
  AddBusinessStepperWidgetState createState() =>
      AddBusinessStepperWidgetState();
}

class AddBusinessStepperWidgetState
    extends ConsumerState<AddBusinessStepperWidget> {
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
    ref.read(businessCreationControllerProvider.notifier).validateAndSubmitForm(
          key: formKey,
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
    final businessCreationController =
        ref.read(businessCreationControllerProvider.notifier);

    return [
      Step(
        title: const Text('Informações básicas'),
        content: Column(
          children: [
            const ImageFieldWidget(),
            TextFormField(
              controller: _nameController,
              decoration:
                  const InputDecoration(labelText: 'Nome do Empreendimento'),
              validator: (value) =>
                  businessCreationController.validateName(value),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
              validator: (value) =>
                  businessCreationController.validateEmail(value),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
              validator: (value) =>
                  businessCreationController.validatePhoneNumber(value),
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Endereço'),
        content: Column(
          children: [
            TextFormField(
              controller: _zipCodeController,
              decoration: const InputDecoration(labelText: 'CEP'),
              validator: (value) =>
                  businessCreationController.validateZipCode(value),
            ),
            TextFormField(
              controller: _streetController,
              decoration: const InputDecoration(labelText: 'Rua'),
              validator: (value) =>
                  businessCreationController.validateAddressStreet(value),
            ),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(labelText: 'Número'),
              validator: (value) =>
                  businessCreationController.validateAddressNumber(value),
            ),
            TextFormField(
              controller: _neighborhoodController,
              decoration: const InputDecoration(labelText: 'Bairro'),
              validator: (value) =>
                  businessCreationController.validateNeighborhood(value),
            ),
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'Cidade'),
              validator: (value) =>
                  businessCreationController.validateCity(value),
            ),
            DropdownButtonFormField<String>(
              menuMaxHeight: MediaQuery.of(context).size.height * 0.45,
              value:
                  _stateController.text.isEmpty ? null : _stateController.text,
              decoration: const InputDecoration(labelText: 'Estado'),
              items: RegistrationUtils().getStatesList(),
              onChanged: (String? newValue) {
                _stateController.text = newValue ?? '';
              },
              validator: (value) =>
                  businessCreationController.validateState(value),
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Categorias'),
        content: FormField<Set<BusinessCategory>>(
          key: ValueKey(_currentStep),
          initialValue: _selectedCategories,
          builder: (FormFieldState<Set<BusinessCategory>> field) {
            return Column(
              children: [
                BusinessCategoryCards(
                  selectedCategories: field.value!,
                  onChanged: (value) {
                    field.didChange(value);
                  },
                ),
                if (field.hasError)
                  Text(
                    field.errorText!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            );
          },
          validator: (value) =>
              businessCreationController.validateCategories(value!),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
        steps: steps,
      ),
    );
  }
}
