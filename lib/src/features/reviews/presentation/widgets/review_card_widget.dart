import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/reviews/application/review_view_model.dart';

class ReviewCardWidget extends StatelessWidget {
  final ReviewModel review;
  final ReviewViewModel reviewViewModel;

  const ReviewCardWidget(
      {super.key, required this.review, required this.reviewViewModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    final colorScheme = getColorScheme(context);

    return Slidable(
      key: ValueKey(review.id),
      startActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const StretchMotion(),
        dismissible: DismissiblePane(
          closeOnCancel: true,
          confirmDismiss: () =>
              reviewViewModel.confirmDeleteReview(review, context),
          onDismissed: () async {
            await reviewViewModel.deleteReview(review: review);
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              reviewViewModel.confirmDeleteReview(review, context);
            },
            borderRadius: BorderRadius.circular(8),
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
            icon: Icons.delete,
            label: 'Deletar',
          ),
        ],
      ),
      child: Card(
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
                      child: FutureBuilder(
                          future:
                              reviewViewModel.getReviewProfilePicture(review),
                          initialData: 'assets/avatars/avatar1.png',
                          builder: (context, snapshot) {
                            return Image.asset(
                              snapshot.data!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            );
                          }),
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
                              review.createdAt
                                          .difference(DateTime.now())
                                          .inDays >
                                      0
                                  ? 'Há ${review.createdAt.difference(DateTime.now()).inDays} dias'
                                  : 'Hoje, ${review.createdAt.hour}:${review.createdAt.minute}',
                              style: textTheme.bodySmall
                                  ?.copyWith(color: colorScheme.onTertiary),
                            ),
                            const Gap(8),
                            reviewViewModel.isReviewOwner(review)
                                ? InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.more_vert,
                                      color: colorScheme.onTertiary,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const Gap(4),
                        Row(
                          children: [
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
      ),
    );
  }
}
