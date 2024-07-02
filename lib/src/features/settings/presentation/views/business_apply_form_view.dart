import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../data/business_registration_enum.dart';

class BusinessApplyFormView extends StatelessWidget {
  final BusinessRegistrationCategory category;

  const BusinessApplyFormView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Formulário de ${category.name[0].toUpperCase()}${category.name.substring(1)}'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarkdownBody(data: category.explanation),
                const SizedBox(height: 20),
                ...category.getFormFields(context),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/business-submission-confirmation',
                          (route) => false);
                    },
                    child: Text(
                      'Cadastrar ${category.name}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
