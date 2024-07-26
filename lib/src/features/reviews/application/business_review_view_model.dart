import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../business/data/business_profile_data/business_profile_provider.dart';
import 'review_view_model.dart';

part 'business_review_view_model.g.dart';

@riverpod
Future<List<ReviewModel>> businessReviews(
    BusinessReviewsRef ref, String uid) async {
  final repository = ref.read(businessProfileDataProvider);
  final profile = await repository.getBusinessProfileData(uid: uid);
  // final mockedReview = ReviewModel.business(
  //   id: '1',
  //   userId: '1',
  //   businessId: '1',
  //   review: 'Muito bom',
  //   profileImageURL: 'https://i.pravatar.cc/250',
  //   reviewerName: 'João',
  //   rating: 4.0,
  //   createdAt: DateTime.now(),
  //   updatedAt: DateTime.now(),
  // );

  return profile?.reviews ?? [];
}

class BusinessReviewViewModel extends ReviewViewModel {
  final WidgetRef ref;

  BusinessReviewViewModel(this.ref);

  @override
  AsyncValue<List<ReviewModel>> getReviews(String uid) {
    final result = ref.watch(businessReviewsProvider(uid));
    return result;
  }

  @override
  Future<void> writeReview(String reviewerId, String reviewedId, double rating,
      String comment) async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    final business = await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: reviewedId);
    if (user == null || business == null) {
      return;
    }
    final review = ReviewModel.business(
        id: const Uuid().v4(),
        userId: reviewerId,
        businessId: reviewedId,
        reviewerName: user.displayName ?? 'Anônimo',
        review: comment,
        rating: rating,
        profileImageURL: user.photoURL ?? 'https://i.pravatar.cc/250',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    return ref.read(businessProfileDataProvider).updateBusinessProfile(
        business: business.copyWith(reviews: [...?business.reviews, review]));
  }

  @override
  void refreshList() {
    ref.invalidate(businessReviewsProvider);
  }
}
