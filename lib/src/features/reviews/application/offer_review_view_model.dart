import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';

import 'review_view_model.dart';

final offerReviewsProvider =
    FutureProvider.family<List<ReviewModel>, String>((ref, uid) async {
  final repository = ref.read(offersDataRepositoryProvider);
  final offer = await repository.getOffer(uid);
  return offer.reviews ?? [];
});

class OfferReviewViewModel extends ReviewViewModel {
  final WidgetRef ref;

  OfferReviewViewModel(this.ref);

  @override
  Future<List<ReviewModel>> fetchReviews({int? limit, String? lastReviewId}) {
    throw UnimplementedError();
  }

  @override
  Future<void> writeReview({required double rating, required String review}) {
    throw UnimplementedError();
  }

  @override
  Future<void> refreshList() {
    // TODO: implement refreshList
    throw UnimplementedError();
  }

  @override
  ProviderBase<AsyncValue<List<ReviewModel>>> getReviewsProvider(
      {int? limit, String? lastReviewId}) {
    throw UnimplementedError();
  }

  @override
  bool isReviewOwner(ReviewModel review) {
    // TODO: implement isReviewOwner
    throw UnimplementedError();
  }

  @override
  Future<String> getReviewProfilePicture(ReviewModel review) {
    // TODO: implement getReviewProfilePicture
    throw UnimplementedError();
  }

  @override
  deleteReview({required ReviewModel review}) {
    // TODO: implement deleteReview
    throw UnimplementedError();
  }

  @override
  double getAverageRating({required String reviewedID}) {
    // TODO: implement getAverageRating
    throw UnimplementedError();
  }

  @override
  Map<int, int> getRatingDistribution({required String reviewedID}) {
    // TODO: implement getRatingDistribution
    throw UnimplementedError();
  }

  @override
  Future<bool> canWriteReview() {
    // TODO: implement canWriteReview
    throw UnimplementedError();
  }
}
