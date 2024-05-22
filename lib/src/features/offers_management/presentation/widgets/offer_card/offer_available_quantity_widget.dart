import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

class OfferAvailableQuantityWidget extends StatelessWidget {
  const OfferAvailableQuantityWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Visibility(
      visible: offer.availableQuantity != null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(
          "${offer.availableQuantity} disponíveis",
          style: textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
