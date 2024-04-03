import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/business/enums.dart';

import '../../application/business_profile_screen_controller/business_profile_screen_controller.dart';

class BusinessCategoryTilesWidget extends ConsumerWidget {
  BusinessCategoryTilesWidget({super.key});

  final Map<BusinessCategory, String> categoriesTranslations =
      businessCategoryTranslations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessCategories =
        ref.watch(businessProfileScreenControllerProvider)?.categories;

    return InkWell(
      child: Wrap(
        children: businessCategories != null
            ? businessCategories.map((category) {
                String translatedCategory =
                    categoriesTranslations[category] ?? category.toString();

                return SizedBox(
                  child: Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        translatedCategory,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                );
              }).toList()
            : const <Widget>[],
      ),
    );
  }
}
