import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/business/enums.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

import '../business_creation/business_category_chips_widget.dart';

class EditBusinessCategoriesDialogWidget extends ConsumerStatefulWidget {
  const EditBusinessCategoriesDialogWidget({
    super.key,
    required this.businessCategories,
  });

  final Set<BusinessCategory>? businessCategories;

  @override
  ConsumerState<EditBusinessCategoriesDialogWidget> createState() =>
      _EditBusinessCategoriesDialogWidgetState();
}

class _EditBusinessCategoriesDialogWidgetState
    extends ConsumerState<EditBusinessCategoriesDialogWidget> {
  Set<BusinessCategory> categories = {};

  @override
  void initState() {
    if (widget.businessCategories != null) {
      widget.businessCategories?.forEach((element) {
        categories.add(element);
      });
    } else {
      categories = {};
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final businessProfileViewModel =
        ref.watch(businessProfileViewModelProvider.notifier);

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            BusinessCategoryChipsWidget(
              selectedCategories: categories,
              onChanged: (categories) {
                setState(() {
                  this.categories = categories;
                });
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                businessProfileViewModel
                    .updateBusinessCategories(categories: categories)
                    .then((value) => Navigator.pop(context));
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
