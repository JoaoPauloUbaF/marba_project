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
  AsyncValue<List<ReviewModel>> getReviews(String uid) {
    return ref.watch(offerReviewsProvider(uid));
  }

  @override
  Future<void> writeReview(
      String reviewerId, String reviewedId, double rating, String comment) {
    // TODO: implement writeReview
    throw UnimplementedError();
  }

  @override
  void refreshList() {
    // TODO: implement refreshList
  }
}
