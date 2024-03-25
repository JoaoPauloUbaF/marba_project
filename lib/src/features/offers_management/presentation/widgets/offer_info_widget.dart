import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_actions_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_header_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_price_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_rating_widget.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferInfoWidget extends ConsumerWidget {
  const OfferInfoWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferHeaderWidget(offer: offer),
            OfferPriceWidget(offer: offer),
            const Row(
              children: [
                OfferRatingWidget(
                  rating: 4, //TODO: change offer model to have rating
                  totalRatings: 444,
                ),
                Spacer(),
                OfferActionsWidget(),
              ],
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
