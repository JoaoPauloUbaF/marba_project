import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

class AddBusinessStepperWidget extends StatefulWidget {
  const AddBusinessStepperWidget({Key? key}) : super(key: key);

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

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _streetController = TextEditingController();
    _numberController = TextEditingController();
    _neighborhoodController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _zipCodeController = TextEditingController();
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
    final newBusiness = Business(
      id: UniqueKey().toString(),
      name: _nameController.text,
      email: _emailController.text,
      phoneNumber: _phoneController.text,
      address: Address(
        street: _streetController.text,
        number: _numberController.text,
        neighborhood: _neighborhoodController.text,
        city: _cityController.text,
        state: _stateController.text,
        zipCode: _zipCodeController.text,
      ),
      status: BusinessStatus.pending,
      type: BusinessType.service,
      offersIds: {},
    );

    print(newBusiness);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        controlsBuilder: (context, details) => Row(
          children: [
            if (_currentStep > 0)
              TextButton(
                onPressed: () {
                  setState(() {
                    _currentStep -= 1;
                  });
                },
                child: const Text('Back'),
              ),
            if (_currentStep < 1)
              TextButton(
                onPressed: () {
                  _submitForm();
                },
                child: const Text('Submit'),
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
        steps: [
          Step(
            title: Text('Basic Information'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              ],
            ),
          ),
          Step(
            title: Text('Address'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _streetController,
                  decoration: InputDecoration(labelText: 'Street'),
                ),
                TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(labelText: 'Number'),
                ),
                TextFormField(
                  controller: _neighborhoodController,
                  decoration: InputDecoration(labelText: 'Neighborhood'),
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
                TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(labelText: 'State'),
                ),
                TextFormField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(labelText: 'Zip Code'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
