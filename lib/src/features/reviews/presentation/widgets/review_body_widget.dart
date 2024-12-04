import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/reviews/presentation/widgets/review_header.dart';
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
    final reviews = ref.watch(reviewViewModel.getReviewsProvider());

    return BaseModalBodyWidget(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: reviews.when(
          data: (reviews) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewHeader(reviewViewModel: reviewViewModel),
                const Gap(16),
                ReviewSummaryWidget(reviewViewModel: reviewViewModel),
                const Gap(16),
                ReviewListWidget(reviewViewModel: reviewViewModel),
              ],
            );
          },
          loading: () => const LoadingWidget(),
          error: (error, stackTrace) => const Center(
            child: Text('Erro ao carregar avaliações'),
          ),
        ),
      ),
    );
  }
}
