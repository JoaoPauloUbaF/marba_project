import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_creation_controller/business_creation_controller.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_category_chips_widget.dart';
import 'package:project_marba/src/shared/models/business/enums.dart';

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
  final BusinessCreationController businessCreationController;

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
              BusinessCategoryChipsWidgets(
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
