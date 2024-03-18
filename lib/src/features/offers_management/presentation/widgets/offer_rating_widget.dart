import 'package:flutter/material.dart';

class OfferRatingWidget extends StatelessWidget {
  const OfferRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star_outline,
            color: Theme.of(context).colorScheme.error,
            size: 16,
          ),
        const SizedBox(width: 8),
        Text(
          "0.0",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 16,
          child: VerticalDivider(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          "444 avaliações",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
