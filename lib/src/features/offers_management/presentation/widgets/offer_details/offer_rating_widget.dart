import 'package:flutter/material.dart';
import 'package:project_marba/src/features/reviews/presentation/widgets/review_body_widget.dart';

import '../../../../reviews/application/review_view_model_provider.dart';

class OfferRatingWidget extends StatelessWidget {
  const OfferRatingWidget({
    super.key,
    required this.rating,
    required this.totalRatings,
    required this.id,
  });

  final double rating;
  final int totalRatings;
  final String id;

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
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: ReviewsBodyWidget(uid: id, type: ReviewViewModelType.offer),
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
            rating.toStringAsFixed(2),
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
