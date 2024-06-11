import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/feed/presentation/widgets/last_consumed.dart';
import 'package:project_marba/src/features/feed/presentation/widgets/offer_row_widget.dart';
import 'package:project_marba/src/features/feed/presentation/widgets/popular_categories.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/current_location_address_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offer_type_filter_widget.dart';

import '../../../offers_management/presentation/widgets/offer_list/offers_list_widget.dart';
import '../../../offers_management/application/offer_list/feed_offers_list_provider.dart';
import '../../application/feed_screen_controller/feed_view_model.dart';
import '../widgets/featured_carousel.dart';

class FeedView extends ConsumerWidget {
  const FeedView({super.key});

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
              automaticallyImplyLeading: false,
              floating: true,
              title: CurrentLocationAddressWidget(),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                thickness: 2,
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(8),
            ),
            const SliverToBoxAdapter(
              child: FeaturedCarousel(),
            ),
            const SliverToBoxAdapter(
              child: Gap(8),
            ),
            const SliverToBoxAdapter(
              child: PopularCategories(),
            ),
            const SliverToBoxAdapter(
              child: Gap(8),
            ),
            // const SliverToBoxAdapter(
            //   child: OfferRowWidget(
            //     title: 'Promoções',
            //   ),
            // ),
            const SliverToBoxAdapter(
              child: Gap(8),
            ),
            const SliverToBoxAdapter(
              child: PopularServicesWidget(),
            ),
            const SliverToBoxAdapter(
              child: Gap(8),
            ),
            // const SliverToBoxAdapter(
            //   child: OfferRowWidget(
            //     title: 'Recomendados',
            //   ),
            // ),
            const SliverToBoxAdapter(
              child: Divider(
                thickness: 2,
              ),
            ),
            SliverAppBar(
              flexibleSpace: const OfferTypeFilterWidget(),
              toolbarHeight: ref.watch(feedOffersTypeFilterProvider) == null
                  ? kToolbarHeight
                  : 2 * kToolbarHeight,
              pinned: true,
            ),
          ];
        },
      ),
    );
  }
}

class FeedSearchFilter extends ConsumerStatefulWidget {
  const FeedSearchFilter({super.key});

  @override
  ConsumerState<FeedSearchFilter> createState() => _FeedSearchFilterState();
}

class _FeedSearchFilterState extends ConsumerState<FeedSearchFilter> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final feedViewModel = ref.watch(feedViewModelProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: isWideScreen(context)
              ? MediaQuery.of(context).size.width * 0.5
              : MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: _searchController,
            onChanged: (value) => feedViewModel.filterOffers(value),
            decoration: const InputDecoration(
              hintText: 'Buscar ofertas...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: EdgeInsets.all(2),
            ),
          ),
        ),
      ],
    );
  }
}
