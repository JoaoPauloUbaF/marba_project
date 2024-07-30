import 'package:flutter/material.dart';
import 'package:project_marba/src/features/reviews/application/review_view_model.dart';
import 'package:project_marba/src/features/reviews/presentation/views/write_review_view.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({
    super.key,
    required this.reviewViewModel,
  });

  final ReviewViewModel reviewViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Avaliações',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WriteReviewView(
                  reviewViewModel: reviewViewModel,
                ),
              ),
            );
          },
          icon: const Icon(Icons.edit_sharp),
        ),
      ],
    );
  }
}
