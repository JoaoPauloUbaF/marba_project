import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

import '../../application/offer_creation/offer_creation_controller.dart';

class OfferCategorySelectionFieldWidget extends ConsumerWidget {
  final OfferType offerType;
  final Set<String> offerCategory;
  final Function(String, bool) onCategorySelected;

  const OfferCategorySelectionFieldWidget({
    super.key,
    required this.offerType,
    required this.offerCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);
    return Wrap(
      spacing: 4.0,
      children: [
        for (var category
            in offerCreationController.getOfferAvailableCategories(offerType))
          ChoiceChip(
            labelPadding: EdgeInsets.zero,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: offerCategory.contains(category.toString())
                      ? Theme.of(context).colorScheme.onTertiary
                      : Theme.of(context).colorScheme.onSurface,
                ),
            checkmarkColor: offerCategory.contains(category.toString())
                ? Theme.of(context).colorScheme.onTertiary
                : Theme.of(context).colorScheme.onSurface,
            label: Text(
              offerCreationController.getCategoryTranslation(
                  category, offerType),
            ),
            selected: offerCategory.contains(category.toString()),
            selectedColor: Theme.of(context).colorScheme.tertiary,
            onSelected: (value) {
              onCategorySelected(category.toString(), value);
            },
          ),
      ],
    );
  }
}
