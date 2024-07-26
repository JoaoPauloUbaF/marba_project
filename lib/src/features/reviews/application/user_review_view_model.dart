import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';

import 'review_view_model.dart';

final userReviewsProvider =
    FutureProvider.family<List<ReviewModel>, String>((ref, uid) async {
  final repository = ref.watch(userProfileDataProvider);
  final user = await repository.getProfileData(uid: uid).first;
  return user?.reviews ?? [];
});

class UserReviewViewModel extends ReviewViewModel {
  final WidgetRef ref;

  UserReviewViewModel(this.ref);

  @override
  AsyncValue<List<ReviewModel>> getReviews(String uid) {
    return ref.watch(userReviewsProvider(uid));
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
