import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/models/business/enums.dart';

import '../../../application/business_profile_view_model/business_profile_screen_controller.dart';

class BusinessCategoryTilesWidget extends ConsumerWidget {
  BusinessCategoryTilesWidget({super.key, BusinessModel? business});

  final Map<BusinessCategory, String> categoriesTranslations =
      businessCategoryTranslations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(businessProfileViewModelProvider);
    final businessProfileViewModel =
        ref.watch(businessProfileViewModelProvider.notifier);

    final businessCategories =
        ref.watch(businessProfileViewModelProvider)?.categories;

    return InkWell(
      onTap: () => businessProfileViewModel.showUpdateCategoriesDialog(context),
      child: Wrap(
        children: businessCategories != null
            ? businessCategories
                .map((category) {
                  String translatedCategory =
                      categoriesTranslations[category] ?? category.toString();

                  return SizedBox(
                    child: Card(
                      color: Theme.of(context).colorScheme.tertiary,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(translatedCategory,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                )),
                      ),
                    ),
                  );
                })
                .take(5)
                .toList()
            : const <Widget>[],
      ),
    );
  }
}
