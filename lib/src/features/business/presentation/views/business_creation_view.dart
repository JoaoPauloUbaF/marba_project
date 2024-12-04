import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_creation/create_business_stepper_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BusinessCreationView extends StatelessWidget {
  const BusinessCreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.create_business)),
      body: const CreateBusinessStepperWidget(),
    );
  }
}
