import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_tile_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/all_business_offers_button.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_description_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_error_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_info_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_ordering_actions_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/other_business_offers_widget.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

import '../../application/offer_details/offer_details_view_model.dart';
import '../widgets/offer_media_widget.dart';

class OfferDetailsScreen extends ConsumerStatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  ConsumerState<OfferDetailsScreen> createState() => OfferDetailsScreenState();
}

class OfferDetailsScreenState extends ConsumerState<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final offer = ref.watch(offerDetailsViewModelProvider);
    final offerDetailsController =
        ref.read(offerDetailsViewModelProvider.notifier);
    final mediaItems = offerDetailsController.getOfferMedia();

    final selectedBusiness = ref.watch(businessProfileViewModelProvider);
    final businessName = selectedBusiness?.name ?? '';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/shopping-cart');
        },
        child: const Icon(Icons.shopping_cart_sharp),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: BackButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
              ),
            ),
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: offer == null
          ? const OfferErrorWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: OfferBodyWidget(
                    mediaItems: mediaItems,
                    offer: offer,
                    businessName: businessName),
              ),
            ),
    );
  }
}

class OfferBodyWidget extends StatelessWidget {
  const OfferBodyWidget({
    super.key,
    required this.mediaItems,
    required this.offer,
    required this.businessName,
  });

  final Set<String> mediaItems;
  final OfferModel offer;
  final String businessName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Column(
            children: [
              OfferMediaWidget(
                items: mediaItems,
              ),
              OfferInfoWidget(offer: offer),
              OrderingActionsWidget(offer: offer),
              BusinessTileWidget(businessId: offer.businessId),
            ],
          ),
        ),
        Container(
          height: 30,
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
        OfferDescriptionWidget(offerDescription: offer.getDescription),
        Divider(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Outras ofertas deste negócio",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const VerticalSpaceMediumWidget(),
        OtherBusinessOffersWidget(
          offerId: offer.id,
          businessId: offer.businessId,
        ),
        const VerticalSpaceMediumWidget(),
        AllBusinessOffersButton(businessName: businessName),
        const VerticalSpaceMediumWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Ofertas relacionadas",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const VerticalSpaceMediumWidget(),
        OtherBusinessOffersWidget(
            offerId: offer.id, businessId: offer.businessId),
      ],
    );
  }
}
