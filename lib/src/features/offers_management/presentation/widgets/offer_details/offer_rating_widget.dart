import 'package:flutter/material.dart';

class OfferRatingWidget extends StatelessWidget {
  const OfferRatingWidget({
    super.key,
    required this.rating,
    required this.totalRatings,
  });

  final double rating;
  final int totalRatings;

  IconData getIcon(int i) {
    if (i <= rating) {
      return Icons.star_sharp;
    } else if (i == rating.round() && rating - rating.floor() >= 0.5) {
      return Icons.star_half;
    } else {
      return Icons.star_border;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: const Center(
              child: Text('Futuro modal de avaliações'),
            ),
          );
        },
      ),
      child: Row(
        children: [
          for (var i = 1; i < 6; i++)
            Icon(
              getIcon(i),
              color: Theme.of(context).colorScheme.error,
              size: 16,
            ),
          const SizedBox(width: 8),
          Text(
            rating.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 16,
            child: VerticalDivider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            "$totalRatings avaliações",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
