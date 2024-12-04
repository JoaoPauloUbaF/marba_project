import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business_analysis/data/utils/business_apply_strings.dart';

class BusinessSubmissionConfirmationView extends StatelessWidget {
  const BusinessSubmissionConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary, size: 100),
              const SizedBox(height: 20),
              Text(
                submitSuccessTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                submitSuccessMessage,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context,
                      (route) => route.settings.name == '/business-apply');
                },
                child: const Text(submitGoBackButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
