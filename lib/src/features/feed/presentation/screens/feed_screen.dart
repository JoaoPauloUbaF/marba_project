import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/current_location_address_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offer_type_filter_widget.dart';

import '../../../offers_management/presentation/widgets/offer_list/offers_list_widget.dart';
import '../../../offers_management/application/offer_list/feed_offers_list_provider.dart';

class FeedOffersView extends ConsumerWidget {
  const FeedOffersView({super.key});

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
            const SliverAppBar(
              floating: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurrentLocationAddressWidget(),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                thickness: 4,
              ),
            ),
            const SliverToBoxAdapter(
              child: OfferTypeFilterWidget(),
            ),
          ];
        },
      ),
    );
  }
}
