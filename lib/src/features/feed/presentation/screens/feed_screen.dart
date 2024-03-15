import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/feed/application/feed_screen_controller/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_filter_widget.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

import '../../../my_business/presentation/components/offers_list_widget.dart';
import '../../../offers_management/application/offer_list/feed_offers_list_provider.dart';
import '../../../offers_management/presentation/widgets/offer_type_filter_tab.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedOffers = ref.watch(feedOffersProvider);
    final feedOffersNotifier = ref.read(feedOffersProvider.notifier);
    final feedOffersTypeFilterNotifier =
        ref.watch(feedOffersTypeFilterProvider.notifier);
    final feedOffersTypeFilter = ref.watch(feedOffersTypeFilterProvider);
    return Scaffold(
      body: NestedScrollView(
        body: OfferListWidget(
            offerProviderNotifier: feedOffersNotifier,
            offerProvider: feedOffers),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.red,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.green,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Categorias',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisExtent: MediaQuery.of(context).size.height * 0.075,
                  ),
                  itemCount: BusinessCategory.values.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      margin: const EdgeInsets.all(8),
                    );
                  },
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Promoções',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.orange,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
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
