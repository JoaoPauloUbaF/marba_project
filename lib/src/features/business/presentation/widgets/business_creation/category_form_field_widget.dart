import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_creation_controller/business_creation_controller.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_creation/business_category_chips_widget.dart';
import 'package:project_marba/src/core/models/business/enums.dart';

class CategoryFormFieldWidget extends StatelessWidget {
  const CategoryFormFieldWidget({
    super.key,
    required this.formKeys,
    required int currentStep,
    required Set<BusinessCategory> selectedCategories,
    required this.context,
    required this.businessCreationController,
  })  : _currentStep = currentStep,
        _selectedCategories = selectedCategories;

  final List<GlobalKey<FormState>> formKeys;
  final int _currentStep;
  final Set<BusinessCategory> _selectedCategories;
  final BuildContext context;
  final BusinessCreationViewModel businessCreationController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeys[2],
      child: FormField<Set<BusinessCategory>>(
        key: ValueKey(_currentStep),
        initialValue: _selectedCategories,
        builder: (FormFieldState<Set<BusinessCategory>> field) {
          return Column(
            children: [
              BusinessCategoryChipsWidget(
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
    );
  }
}
