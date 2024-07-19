import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/business_analysis/data/utils/business_apply_strings.dart';
import 'package:project_marba/src/features/image_picker/presentation/widgets/image_field_widget.dart';

import '../../data/utils/business_registration_enum.dart';
import '../../application/business_analysis_view_model.dart';

class BusinessApplyFormView extends ConsumerStatefulWidget {
  final BusinessRegistrationCategory category;

  const BusinessApplyFormView({
    super.key,
    required this.category,
  });

  @override
  ConsumerState<BusinessApplyFormView> createState() =>
      _BusinessApplyFormViewState();
}

class _BusinessApplyFormViewState extends ConsumerState<BusinessApplyFormView> {
  final key = GlobalKey<FormState>();
  late Map<String, TextEditingController> _controllers;
  late Map<String, File?> _imageFiles;

  @override
  void initState() {
    super.initState();
    _controllers = {};
    _imageFiles = {};

    final fieldsData = widget.category.getFormFieldsData();
    for (var field in fieldsData) {
      if (field['type'] == 'text') {
        if (field['key'] != null) {
          if (field['mask'] == null) {
            _controllers[field['key']] = TextEditingController();
          } else {
            _controllers[field['key']] =
                MaskedTextController(mask: field['mask']);
          }
        }
      } else if (field['type'] == 'image') {
        _imageFiles[field['key']] = null;
      }
    }
  }

  void populateFields() {
    final defaultTextValues = {
      'companyName': 'Jon Doe Company',
      'cnpj': '12.345.678/0001-90',
      'businessAddress': '123 Business St.',
      'contactPhone': '(12) 34567-8901',
      'email': 'jon.doe@example.com',
      'fullName': 'Jon Doe',
      'cpf': '123.456.789-00',
      'rgOrCnh': 'mg18.598.015',
      'address': '123 Main St.'
    };

    _controllers.forEach((key, controller) {
      if (defaultTextValues.containsKey(key)) {
        controller.text = defaultTextValues[key]!;
      }
    });
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = BusinessAnalysisViewModel(ref);
    final fieldsData = widget.category.getFormFieldsData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category.name[0].toUpperCase()}${widget.category.name.substring(1)}',
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarkdownBody(data: widget.category.explanation),
                  const SizedBox(height: 20),
                  kDebugMode
                      ? Center(
                          child: ElevatedButton(
                            onPressed: populateFields,
                            child: const Text('Preencher campos (DEV)'),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 10),
                  for (var field in fieldsData)
                    if (field['type'] == 'text')
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          controller: _controllers[field['key']],
                          decoration: InputDecoration(
                            labelText: field['label'],
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) => viewModel.validate(
                              field['type'], field['validator'], value),
                        ),
                      )
                    else if (field['type'] == 'image')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            field['label'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ImageFieldWidget(
                                  imageURL: _imageFiles[field['key']]?.path,
                                  onImagePicked: (image) {
                                    _imageFiles[field['key']] = image;
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        if (!key.currentState!.validate()) {
                          return;
                        } else {
                          final formData = {
                            for (var entry in _controllers.entries)
                              entry.key: entry.value.text,
                          };
                          viewModel
                              .submitBusinessAnalysisForm(
                            context,
                            category: widget.category,
                            formData: formData,
                            imageFiles: _imageFiles,
                          )
                              .catchError((error) {
                            hideLoader(context);
                            log('Error submitting business analysis form: $error');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Erro'),
                                    content: const Text(submitErrorMessage),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          });
                        }
                      },
                      child: Text(
                        'Enviar',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
