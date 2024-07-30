import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/reviews/application/review_view_model.dart';

class ReviewSummaryWidget extends StatelessWidget {
  final ReviewViewModel reviewViewModel;

  const ReviewSummaryWidget({
    super.key,
    required this.reviewViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    final colorScheme = getColorScheme(context);
    final averageRating = reviewViewModel.getAverageRating(reviews: []);
    final ratingDistribution =
        reviewViewModel.getRatingDistribution(reviews: []);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              averageRating.toStringAsFixed(1),
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const Gap(4),
            Text(
              'Média de Avaliações',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.secondary,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(5, (index) {
            final starRating = 5 - index;
            final count = ratingDistribution[starRating] ?? 0;
            return Row(
              children: [
                for (var i = 0; i < starRating; i++)
                  Icon(Icons.star, color: colorScheme.primary),
                const SizedBox(width: 5),
                Text(
                  '($count)',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
