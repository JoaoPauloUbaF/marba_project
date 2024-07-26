import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/reviews/presentation/widgets/review_card_widget.dart';

class ReviewListWidget extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: reviews.isEmpty
          ? const Center(child: Text('Nenhuma avaliação encontrada'))
          : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewCardWidget(review: reviews[index]);
              },
            ),
    );
  }
}
