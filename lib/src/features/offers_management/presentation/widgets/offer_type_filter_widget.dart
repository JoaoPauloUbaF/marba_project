import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/models/offer/offer_model.dart';
import '../../application/offer_list/feed_offers_type_filter_provider.dart';
import 'offer_type_filter_tab.dart';

class OfferTypeFilterWidget extends ConsumerWidget {
  const OfferTypeFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedOffersTypeFilterNotifier =
        ref.watch(feedOffersTypeFilterProvider.notifier);
    final feedOffersTypeFilter = ref.watch(feedOffersTypeFilterProvider);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OfferTypeFilterTab(
            onTap: () => feedOffersTypeFilterNotifier.setOfferTypeFilter(null),
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
    );
  }
}
