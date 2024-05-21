import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_title_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_price_widget.dart';

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
          height: MediaQuery.of(context).size.height * 0.3,
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
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OfferTitleWidget(offer: offer, fontSize: 18),
                        OfferPriceWidget(offer: offer, fontSize: 14),
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
