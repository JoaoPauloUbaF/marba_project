import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_details/offer_actions_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_details/offer_header_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_details/offer_price_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_details/offer_rating_widget.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

class OfferInfoWidget extends ConsumerWidget {
  const OfferInfoWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OfferHeaderWidget(offer: offer),
          OfferDetailsPriceWidget(offer: offer),
          Row(
            children: [
              OfferRatingWidget(
                rating: offer.ratingValue,
                totalRatings: offer.totalRatings,
              ),
              const Spacer(),
              const OfferActionsWidget(),
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
