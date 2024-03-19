import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_tile_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_description_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_info_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_ordering_actions_widget.dart';

import '../../application/offer_details/offer_details_controller.dart';
import '../../application/offer_list/business_offers_provider.dart';
import '../widgets/offer_card_widget.dart';
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

    final offer = offerSelected!;
    // final offer = MockUtils().getMockedOfferModel();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OfferMediaWidget(
                items: items,
              ),
              OfferInfoWidget(offer: offer),
              OfferOrderingActionsWidget(offer: offer),
              BusinessTileWidget(businessId: offer.businessId),
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
              OfferDescriptionWidget(offer: offer),
              Divider(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              Text(
                "Outras ofertas deste negócio",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              businessOffers.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (businessOffers) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var businessOffer in businessOffers
                          .where((element) => element.id != offer.id)
                          .take(6))
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: OfferCardWidget(
                            offer: businessOffer,
                            isBusiness: false,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                  label: const Text('Ver todas as ofertas'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Ofertas relacionadas",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              businessOffers.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (businessOffers) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var businessOffer in businessOffers
                          .where((element) => element.id != offer.id)
                          .take(6))
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: OfferCardWidget(
                            offer: businessOffer,
                            isBusiness: false,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
