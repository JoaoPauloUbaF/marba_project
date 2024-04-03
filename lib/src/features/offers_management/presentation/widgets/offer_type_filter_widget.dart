import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../../core/models/product/enums.dart';
import '../../../../core/models/service/enums.dart';
import '../../application/offer_list/feed_offers_type_filter_provider.dart';
import '../../application/offer_list/offer_product_category_filter_provider.dart';
import '../../application/offer_list/offer_service_category_filter_provider.dart';
import 'item_category_filter_widget.dart';
import 'offer_type_filter_tab.dart';

class OfferTypeFilterWidget extends ConsumerWidget {
  const OfferTypeFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedOffersTypeFilterNotifier =
        ref.read(feedOffersTypeFilterProvider.notifier);
    final feedOffersTypeFilter = ref.watch(feedOffersTypeFilterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OfferTypeFilterTab(
                  onTap: () =>
                      feedOffersTypeFilterNotifier.setOfferTypeFilter(null),
                  icon: Icons.local_offer_sharp,
                  text: 'Todos',
                  isSelected: feedOffersTypeFilter == null,
                ),
                OfferTypeFilterTab(
                  onTap: () => feedOffersTypeFilterNotifier
                      .setOfferTypeFilter(OfferType.product),
                  icon: Icons.shopping_cart_sharp,
                  text: 'Produtos',
                  isSelected: feedOffersTypeFilter == OfferType.product,
                ),
                OfferTypeFilterTab(
                  onTap: () => feedOffersTypeFilterNotifier
                      .setOfferTypeFilter(OfferType.service),
                  icon: Icons.build_sharp,
                  text: 'Serviços',
                  isSelected: feedOffersTypeFilter == OfferType.service,
                ),
              ],
            ),
          ),
          if (feedOffersTypeFilter == OfferType.product)
            ItemCategoryFilterWidget(
              categories: ProductCategory.values,
              categoryFilterProvider: ref.watch(productCategoryFilterProvider),
              categoryFilterProviderNotifier:
                  ref.read(productCategoryFilterProvider.notifier),
            ),
          if (feedOffersTypeFilter == OfferType.service)
            ItemCategoryFilterWidget(
              categories: ServiceCategory.values,
              categoryFilterProvider: ref.watch(serviceCategoryFilterProvider),
              categoryFilterProviderNotifier:
                  ref.read(serviceCategoryFilterProvider.notifier),
            ),
        ],
      ),
    );
  }
}
