import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_title_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_price_widget.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../../core/utils/view_utils.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../offers_management/application/offer_card/offer_card_view_model.dart';
import '../../application/hot_offers_provider/hot_offers_provider.dart';

class HotOffersWidget extends ConsumerWidget {
  const HotOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotOffers = ref.watch(hotOffersProvider);
    return hotOffers.when(
      data: (offers) => offers.isEmpty
          ? SizedBox(
              height: 200,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Ainda não há ofertas disponíveis',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary),
                  ),
                ),
              ),
            )
          : CarouselSlider(
              items: offers
                  .map((offer) => HotOfferCardWidget(offer: offer))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayInterval: const Duration(seconds: 3),
                height: 200,
                viewportFraction: isWideScreen(context) ? 0.3 : 0.9,
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
    final cardController = ref.read(offerCardViewModelProvider.notifier);

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
                height: 200,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                          ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child:
                                OfferTitleWidget(offer: offer, fontSize: 18)),
                        Flexible(
                            child:
                                OfferPriceWidget(offer: offer, fontSize: 14)),
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
