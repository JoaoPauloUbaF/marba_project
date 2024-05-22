import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_available_quantity_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_title_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_price_widget.dart';

import '../../../application/offer_card/offer_card.controller.dart';
import '../offer_quick_manage_widget.dart';

class OfferCardWidget extends ConsumerWidget {
  final OfferModel offer;

  const OfferCardWidget({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardController = ref.read(offerCardControllerProvider.notifier);
    log(offer.toJson().toString());
    return InkWell(
      onTap: () => cardController.onCardTap(offer, context).then(
            (value) => Navigator.of(context).pushNamed(
              '/offer-details',
            ),
          ),
      child: Hero(
        tag: 'offerImage',
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).colorScheme.secondary,
          shadowColor: Theme.of(context).colorScheme.onSurface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                Image.network(
                  offer.getImageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 150,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    log('$error');
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Icon(
                          Icons.error,
                          color: Theme.of(context).colorScheme.error,
                          size: 30,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: FutureBuilder(
                    future:
                        cardController.shouldShowOfferActions(offer.businessId),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data
                            ? OfferQuickManageWidget(offer: offer)
                            : const SizedBox.shrink();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ]),
              OfferTitleWidget(offer: offer, fontSize: 16),
              OfferPriceWidget(offer: offer, fontSize: 14),
              OfferAvailableQuantityWidget(offer: offer),
            ],
          ),
        ),
      ),
    );
  }
}
