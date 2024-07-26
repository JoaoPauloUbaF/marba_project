import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/reviews/presentation/views/write_review_view.dart';
import 'package:project_marba/src/features/reviews/presentation/widgets/review_list_widget.dart';
import 'package:project_marba/src/features/reviews/presentation/widgets/review_summary_widget.dart';

import '../../application/review_view_model_provider.dart';

class ReviewsBodyWidget extends ConsumerWidget {
  final String uid;
  final ReviewViewModelType type;

  const ReviewsBodyWidget({
    super.key,
    required this.uid,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewViewModel =
        ref.watch(reviewViewModelProvider(type: type, widgetRef: ref));

    return BaseModalBodyWidget(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: reviewViewModel.getReviews(uid).when(
              data: (reviews) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Avaliações',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WriteReviewView(
                                uid: uid,
                                type: type,
                              ),
                            ),
                          );
                          if (result == true) {
                            reviewViewModel.refreshList();
                          }
                        },
                        icon: const Icon(Icons.edit_sharp),
                      ),
                    ],
                  ),
                  const Gap(16),
                  ReviewSummaryWidget(
                    reviews: reviews,
                    reviewViewModel: reviewViewModel,
                  ),
                  const Gap(16),
                  Expanded(child: ReviewListWidget(reviews: reviews)),
                ],
              ),
              loading: () => const LoadingWidget(),
              error: (error, stackTrace) => const Center(
                child: Text('Erro ao carregar avaliações'),
              ),
            ),
      ),
    );
  }
}
