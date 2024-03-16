import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class ItemCategoryFilterWidget extends ConsumerWidget {
  final dynamic categories;
  final dynamic categoryFilterProvider;
  final dynamic categoryFilterProviderNotifier;

  const ItemCategoryFilterWidget({
    super.key,
    required this.categories,
    required this.categoryFilterProvider,
    required this.categoryFilterProviderNotifier,
  });

  onChipSelected(dynamic category) {
    if (categoryFilterProvider == category) {
      categoryFilterProviderNotifier.setCategoryFilter(null);
    } else {
      categoryFilterProviderNotifier.setCategoryFilter(category);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var category in categories)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip.elevated(
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  label: Text(
                    offerCreationController.getCategoryTranslation(
                        category.toString(), OfferType.product),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  selected: categoryFilterProvider == category,
                  selectedColor: Theme.of(context).colorScheme.onPrimary,
                  onSelected: (value) {
                    onChipSelected(category);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
