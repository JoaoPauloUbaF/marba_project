import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_creation/create_business_stepper_widget.dart';

class BusinessCreationView extends StatelessWidget {
  const BusinessCreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Negócio')),
      body: const CreateBusinessStepperWidget(),
    );
  }
}
