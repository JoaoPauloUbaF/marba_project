import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_tile_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_description_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_info_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_ordering_actions_widget.dart';

import '../../application/offer_details/offer_details_controller.dart';
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
    final offer = ref.watch(offerDetailsControllerProvider);
    final offerDetailsController =
        ref.read(offerDetailsControllerProvider.notifier);
    final items = offerDetailsController.getOfferMedia();
    final moreBusinessOffers = ref.watch(
      otherBusinessOffersProvider(offer?.businessId ?? ''),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        forceMaterialTransparency: true,
      ),
      body: offer == null
          ? Center(
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'Houve um erro ao carregar a oferta.\n      Tente novamente mais tarde.'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Retornar'),
                  ),
                ],
              ),
            ))
          : SingleChildScrollView(
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
                    OfferDescriptionWidget(offerDescription: offer.description),
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
                    const SizedBox(height: 8),
                    moreBusinessOffers.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                      data: (businessOffers) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var businessOffer in businessOffers
                                .where((element) => element.id != offer.id))
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: OfferCardWidget(
                                  offer: businessOffer,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Ofertas relacionadas",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    moreBusinessOffers.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                      data: (businessOffers) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var businessOffer in businessOffers
                                .where((element) => element.id != offer.id))
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: OfferCardWidget(
                                  offer: businessOffer,
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
