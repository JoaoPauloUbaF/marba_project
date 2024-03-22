import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_filter_widget.dart';

import '../../../my_business/presentation/components/offers_list_widget.dart';
import '../../../offers_management/application/offer_list/feed_offers_list_provider.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedOffers = ref.watch(feedOffersProvider);
    final feedOffersNotifier = ref.read(feedOffersProvider.notifier);

    return Scaffold(
      body: NestedScrollView(
        body: OfferListWidget(
          offerProviderNotifier: feedOffersNotifier,
          offerProvider: feedOffers,
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(
              child: OfferTypeFilterWidget(),
            ),
          ];
        },
      ),
    );
  }
}
