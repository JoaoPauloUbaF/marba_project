import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_view_model.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../user_profile/data/user_profile_provider.dart';
import 'review_view_model.dart';

part 'offer_review_view_model.g.dart';

@riverpod
Future<List<ReviewModel>> offerReviews(
    Ref ref, String uid, int? limit, String? lastReviewId) async {
  final repository = ref.read(offersDataRepositoryProvider);
  final reviews = await repository.fetchReviews(
      offerId: uid, limit: limit ?? 3, lastReviewId: lastReviewId);
  return reviews;
}

class OfferReviewViewModel extends ReviewViewModel {
  final WidgetRef ref;

  OfferReviewViewModel(this.ref);

  @override
  ProviderBase<AsyncValue<List<ReviewModel>>> getReviewsProvider(
      {String? lastReviewId, int? limit}) {
    final id = ref.read(offerDetailsViewModelProvider)?.id;
    if (id == null) {
      throw Exception('Offer not found');
    }
    return offerReviewsProvider(id, limit, lastReviewId);
  }

  @override
  Future<List<ReviewModel>> fetchReviews({int? limit, String? lastReviewId}) {
    final repository = ref.read(offersDataRepositoryProvider);
    final uid = ref.read(offerDetailsViewModelProvider)?.id;
    if (uid == null) {
      throw Exception('Offer not found');
    }
    return repository.fetchReviews(
        offerId: uid, limit: limit ?? 3, lastReviewId: lastReviewId);
  }

  @override
  Future<void> writeReview(
      {required double rating, required String review}) async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    final offer = ref.read(offerDetailsViewModelProvider);

    if (user == null || offer == null) {
      throw Exception('User or offer not found');
    }

    final reviewModel = ReviewModel.offer(
      id: const Uuid().v4(),
      userId: user.uid,
      offerId: offer.id,
      reviewerName: user.displayName ?? 'Anônimo',
      review: review,
      rating: rating,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return ref
        .read(offersDataRepositoryProvider)
        .writeReview(offerId: offer.id, review: reviewModel)
        .then((_) async {
      ref.invalidate(offerDetailsViewModelProvider);
      final updatedOffer =
          await ref.read(offersDataRepositoryProvider).getOffer(offer.id);
      ref
          .read(offerDetailsViewModelProvider.notifier)
          .setSelectedOffer(updatedOffer);
      refreshList();
    });
  }

  @override
  Future<void> refreshList() async {
    ref.invalidate(offerReviewsProvider);
  }

  @override
  bool isReviewOwner(ReviewModel review) {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      return false;
    }
    return review.userId == user.id;
  }

  @override
  Future<String> getReviewProfilePicture(ReviewModel review) async {
    final user = await ref
        .read(userProfileDataProvider)
        .getProfileData(uid: review.userId)
        .first;
    if (user == null) {
      return 'assets/avatars/avatar1.png';
    }
    return user.photoUrl ?? 'assets/avatars/avatar1.png';
  }

  @override
  Future<bool> canWriteReview() async {
    final user = ref.read(currentUserProvider);
    final offer = ref.read(offerDetailsViewModelProvider);

    if (user == null || offer == null) {
      return false;
    }

    // Assuming some validation logic, adjust as needed for actual implementation.
    return true;
  }

  @override
  deleteReview({required ReviewModel review}) async {
    final offer = review.maybeWhen(
      offer: (id, userId, reviewerName, offerId, review, rating, createdAt,
              updatedAt) =>
          offerId,
      orElse: () => null,
    );

    if (offer == null) {
      throw Exception('Offer not found');
    }
    return await ref.read(offersDataRepositoryProvider).deleteReview(
          offerId: offer,
          reviewId: review.id,
        );
  }

  @override
  double getAverageRating({required String reviewedID}) {
    return ref.read(offerDetailsViewModelProvider)?.rating ?? 0;
  }

  @override
  Map<int, int> getRatingDistribution({required String reviewedID}) {
    return ref.read(offerDetailsViewModelProvider)?.ratingDistribution ?? {};
  }
}
