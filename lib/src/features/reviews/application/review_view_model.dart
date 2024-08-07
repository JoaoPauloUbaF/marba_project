import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/review/review_model.dart';

part 'review_view_model.g.dart';

abstract class ReviewViewModel {
  ProviderBase<AsyncValue<List<ReviewModel>>> getReviewsProvider(
      {int? limit, String? lastReviewId});

  double getAverageRating({required String reviewedID});

  Map<int, int> getRatingDistribution({required String reviewedID});

  Future<bool> confirmDeleteReview(
      ReviewModel review, BuildContext context) async {
    final shouldDeleteReview = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deletar avaliação'),
          content: const Text('Tem certeza que deseja deletar essa avaliação?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Deletar'),
            ),
          ],
        );
      },
    );
    return shouldDeleteReview ?? false;
  }

  Future<List<ReviewModel>> fetchReviews({int? limit, String? lastReviewId});

  Future<bool> canWriteReview();

  Future<void> writeReview({required double rating, required String review});

  Future<void> refreshList();

  bool isReviewOwner(ReviewModel review);

  Future<void> deleteReview({required ReviewModel review});

  Future<String> getReviewProfilePicture(ReviewModel review);
}

@riverpod
class RatingCounter extends _$RatingCounter {
  @override
  double build() {
    return 0;
  }

  void setState(double value) {
    super.state = value;
  }
}
