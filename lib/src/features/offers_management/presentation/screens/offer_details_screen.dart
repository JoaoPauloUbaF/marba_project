import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_tile_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_description_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_info_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_ordering_actions_widget.dart';
import 'package:project_marba/src/utils/mock_utils.dart';

import '../../application/offer_details/offer_details_controller.dart';
import '../../application/offer_list/business_offers_provider.dart';
import '../widgets/offer_media_widget.dart';

class OfferDetailsScreen extends ConsumerStatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  ConsumerState<OfferDetailsScreen> createState() => OfferDetailsScreenState();
}

class OfferDetailsScreenState extends ConsumerState<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final offerSelected = ref.watch(offerDetailsControllerProvider);
    final offerDetailsController =
        ref.read(offerDetailsControllerProvider.notifier);
    final items = offerDetailsController.getOfferMedia();
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);

    bool isTest = false;
    final offer = isTest
        ? MockUtils().getMockedOfferModel()
        : offerSelected!; //TODO: default offer for testing/placeholders

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: OfferMediaWidget(
                items: items,
              ),
            ),
            SliverToBoxAdapter(
              child: OfferInfoWidget(offer: offer),
            ),
            SliverToBoxAdapter(
              child: OfferOrderingActionsWidget(offer: offer),
            ),
            SliverToBoxAdapter(
              child: BusinessTileWidget(businessId: offer.businessId),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.secondaryContainer,
                      Theme.of(context).colorScheme.background,
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: OfferDescriptionWidget(offer: offer),
            ),
            SliverToBoxAdapter(
              child: Divider(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Outras ofertas deste negócio",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: OfferListWidget(
              // TODO: Only the other offers from the same business
              offerProviderNotifier: businessOffersNotifier,
              offerProvider: businessOffers,
              isBusiness: false),
        ),
      ),
    );
  }
}
