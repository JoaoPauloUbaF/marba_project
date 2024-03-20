import 'package:flutter/material.dart';

class OfferDescriptionWidget extends StatelessWidget {
  const OfferDescriptionWidget({
    super.key,
    required this.offerDescription,
  });

  final String offerDescription;

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
            offerDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
