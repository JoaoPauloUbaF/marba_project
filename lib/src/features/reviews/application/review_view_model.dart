import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/review/review_model.dart';

abstract class ReviewViewModel {
  AsyncValue<List<ReviewModel>> getReviews(String uid);
  double getAverageRating({required List<ReviewModel> reviews}) {
    if (reviews.isEmpty) {
      return 0.0;
    }
    final totalRating = reviews.fold<double>(
      0.0,
      (sum, review) => sum + review.rating,
    );
    return totalRating / reviews.length;
  }

  Map<int, int> getRatingDistribution({required List<ReviewModel> reviews}) {
    final Map<int, int> distribution = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    for (var review in reviews) {
      distribution[review.rating.toInt()] =
          (distribution[review.rating] ?? 0) + 1;
    }
    return distribution;
  }

  canWriteReview(String uid) {
    return true;
  }

  Future<void> writeReview(
      String reviewerId, String reviewedId, double rating, String comment);

  void refreshList();
}
