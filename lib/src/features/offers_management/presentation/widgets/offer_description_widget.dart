import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferDescriptionWidget extends StatelessWidget {
  const OfferDescriptionWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descrição",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          Text(
            offer.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
