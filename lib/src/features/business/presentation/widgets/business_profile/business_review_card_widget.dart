import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../application/business_profile_view_model/business_profile_screen_controller.dart';

class BusinessReviewCardWidget extends ConsumerWidget {
  const BusinessReviewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(businessProfileViewModelProvider.notifier);
    final rating = viewModel.getReviewsRating();
    final reviewsNumber = viewModel.getReviewsNumber();
    return Expanded(
      child: Card(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              const Gap(4),
              Text(
                rating,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Gap(4),
              Text(
                reviewsNumber != null
                    ? '($reviewsNumber avaliações)'
                    : '(sem avaliações)',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
