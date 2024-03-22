import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project_marba/src/features/image_picker/presentation/widgets/image_field_widget.dart';
import 'package:project_marba/src/features/my_business/application/business_creation_controller/business_creation_controller.dart';

import '../../../../shared/models/business/enums.dart';
import '../../../../utils/registration_utils.dart';
import 'business_category_cards_widget.dart';

class AddBusinessStepperWidget extends ConsumerStatefulWidget {
  const AddBusinessStepperWidget({super.key});
  @override
  AddBusinessStepperWidgetState createState() =>
      AddBusinessStepperWidgetState();
}

class AddBusinessStepperWidgetState
    extends ConsumerState<AddBusinessStepperWidget> {
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
    final controller = ref.read(businessCreationControllerProvider.notifier);
    controller
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
            controller.showSuccessDialog(context, _nameController.text),
          },
        );
  }

  List<Step> get steps {
    final businessCreationController =
        ref.read(businessCreationControllerProvider.notifier);

    return [
      Step(
        title: const Text('Informações básicas'),
        content: Form(
          onChanged: () => setState(() {}),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKeys[0],
          child: Column(
            children: [
              const ImageFieldWidget(),
              TextFormField(
                key: const ValueKey('name'),
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
      ),
      Step(
        title: const Text('Endereço'),
        content: Form(
          onChanged: () => setState(() {}),
          key: formKeys[1],
          child: Column(
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
                value: _stateController.text.isEmpty
                    ? null
                    : _stateController.text,
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
      ),
      Step(
        title: const Text('Categorias'),
        content: Form(
          key: formKeys[2],
          child: FormField<Set<BusinessCategory>>(
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
                    Text(field.errorText!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            )),
                ],
              );
            },
            validator: (value) =>
                businessCreationController.validateCategories(value!),
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final businessCreationController =
        ref.read(businessCreationControllerProvider.notifier);

    return Stepper(
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
                  onPressed:
                      (formKeys[_currentStep].currentState?.validate() ?? false)
                          ? details.onStepContinue
                          : null,
                  icon: const Icon(Icons.arrow_forward_rounded),
                )
              : const SizedBox.shrink(),
          details.currentStep == steps.length - 1
              ? TextButton(
                  onPressed: () {
                    if (formKeys[_currentStep].currentState?.validate() ??
                        false) {
                      businessCreationController.showLoadingDialog(context);
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
