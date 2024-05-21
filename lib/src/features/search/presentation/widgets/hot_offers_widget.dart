import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../../core/utils/registration_utils.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../offers_management/application/offer_card/offer_card.controller.dart';
import '../../application/hot_offers_provider/hot_offers_provider.dart';

class HotOffersWidget extends ConsumerWidget {
  const HotOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotOffers = ref.watch(hotOffersProvider);
    return hotOffers.when(
      data: (offers) => CarouselSlider(
        items: offers.map((offer) => HotOfferCardWidget(offer: offer)).toList(),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayInterval: const Duration(seconds: 3),
          aspectRatio: 2.0,
        ),
      ),
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}

class HotOfferCardWidget extends ConsumerWidget {
  const HotOfferCardWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardController = ref.read(offerCardControllerProvider.notifier);

    return InkWell(
      onTap: () => cardController.onCardTap(offer, context).then(
            (value) => Navigator.of(context).pushNamed(
              '/offer-details',
            ),
          ),
      child: Card(
        // make it better looking
        color: Theme.of(context).colorScheme.tertiary,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: Stack(
            children: [
              Image.network(
                offer.getImageUrl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.7),
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer.getTitle,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          RegistrationUtils().doubleAsCurrency(offer.getPrice),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
