import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReviewCardWidget extends StatelessWidget {
  final ReviewModel review;

  const ReviewCardWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    final colorScheme = getColorScheme(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: colorScheme.tertiary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: colorScheme.onTertiary,
                    ),
                    color: colorScheme.onTertiary,
                    shape: BoxShape.circle,
                  ),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: review.profileImageURL,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: colorScheme.tertiary,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              review.reviewerName,
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onTertiary,
                              ),
                            ),
                          ),
                          Text(
                            review.createdAt.difference(DateTime.now()).inDays >
                                    0
                                ? 'Há ${review.createdAt.difference(DateTime.now()).inDays} dias'
                                : 'Hoje',
                            style: textTheme.bodySmall
                                ?.copyWith(color: colorScheme.onTertiary),
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            shadows: [
                              BoxShadow(
                                color: colorScheme.onTertiary,
                                blurRadius: 5,
                              ),
                            ],
                            size: 16,
                            color: index < review.rating
                                ? colorScheme.onTertiary
                                : colorScheme.tertiaryContainer,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(8),
            Text(
              review.review,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onTertiary.withAlpha(200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
