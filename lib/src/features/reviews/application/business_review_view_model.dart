import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../business/data/business_profile_data/business_profile_provider.dart';
import 'review_view_model.dart';

part 'business_review_view_model.g.dart';

@riverpod
Future<List<ReviewModel>> businessReviews(BusinessReviewsRef ref, String uid,
    int? limit, String? lastReviewId) async {
  final repository = ref.read(businessProfileDataProvider);
  final reviews = await repository.fetchReviews(
      businessId: uid, limit: limit ?? 3, lastReviewId: lastReviewId);
  return reviews;
}

class BusinessReviewViewModel extends ReviewViewModel {
  final WidgetRef ref;

  BusinessReviewViewModel(this.ref);

  @override
  ProviderBase<AsyncValue<List<ReviewModel>>> getReviewsProvider(
      {String? lastReviewId, int? limit}) {
    final id = ref.read(businessProfileViewModelProvider)?.id;
    if (id == null) {
      throw Exception('Business not found');
    }
    return businessReviewsProvider(id, limit, lastReviewId);
  }

  @override
  Future<List<ReviewModel>> fetchReviews({int? limit, String? lastReviewId}) {
    final repository = ref.read(businessProfileDataProvider);
    final uid = ref.read(businessProfileViewModelProvider)?.id;
    if (uid == null) {
      throw Exception('Business not found');
    }
    return repository.fetchReviews(
        businessId: uid, limit: limit ?? 3, lastReviewId: lastReviewId);
  }

  @override
  Future<void> writeReview(
      {required double rating, required String review}) async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    final business = ref.read(businessProfileViewModelProvider);

    if (user == null || business == null) {
      throw Exception('User or business not found');
    }

    final reviewModel = ReviewModel.business(
      id: const Uuid().v4(),
      userId: user.uid,
      businessId: business.id,
      reviewerName: user.displayName ?? 'Anônimo',
      review: review,
      rating: rating,
      profileImageURL: user.photoURL ?? 'https://i.pravatar.cc/250',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return ref
        .read(businessProfileDataProvider)
        .writeReview(businessId: business.id, review: reviewModel);
  }

  @override
  void refreshList() {
    ref.invalidate(businessReviewsProvider);
  }
}
