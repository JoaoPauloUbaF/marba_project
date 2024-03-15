import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_filter_widget.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:project_marba/src/shared/models/product/product.dart';

import '../../../../shared/models/service/service.dart';
import '../../../my_business/presentation/components/offers_list_widget.dart';
import '../../../offers_management/application/offer_creation/offer_creation_controller.dart';
import '../../../offers_management/application/offer_list/feed_offers_list_provider.dart';
import '../../../offers_management/application/offer_list/offer_product_category_filter_provider.dart';
import '../../../offers_management/application/offer_list/offer_service_category_filter_provider.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedOffers = ref.watch(feedOffersProvider);
    final feedOffersNotifier = ref.read(feedOffersProvider.notifier);

    final feedOffersTypeFilter = ref.watch(feedOffersTypeFilterProvider);
    return Scaffold(
      body: NestedScrollView(
        body: OfferListWidget(
            offerProviderNotifier: feedOffersNotifier,
            offerProvider: feedOffers,
            isBusiness: false),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(
              child: OfferTypeFilterWidget(),
            ),
            if (feedOffersTypeFilter == OfferType.product)
              SliverToBoxAdapter(
                child: ItemCategoryFilterWidget(
                  categories: ProductCategory.values,
                  categoryFilterProvider:
                      ref.watch(productCategoryFilterProvider),
                  categoryFilterProviderNotifier:
                      ref.read(productCategoryFilterProvider.notifier),
                ),
              ),
            if (feedOffersTypeFilter == OfferType.service)
              SliverToBoxAdapter(
                child: ItemCategoryFilterWidget(
                  categories: ServiceCategory.values,
                  categoryFilterProvider:
                      ref.watch(serviceCategoryFilterProvider),
                  categoryFilterProviderNotifier:
                      ref.read(serviceCategoryFilterProvider.notifier),
                ),
              ),
          ];
        },
      ),
    );
  }
}

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
                  selectedColor:
                      Theme.of(context).colorScheme.secondaryContainer,
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
