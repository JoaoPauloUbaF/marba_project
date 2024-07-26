import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/reviews/application/business_review_view_model.dart';
import 'package:project_marba/src/features/reviews/application/offer_review_view_model.dart';
import 'package:project_marba/src/features/reviews/application/user_review_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'review_view_model.dart';

part 'review_view_model_provider.g.dart';

enum ReviewViewModelType { business, offer, user }

@riverpod
ReviewViewModel reviewViewModel(ReviewViewModelRef ref,
    {required ReviewViewModelType type, required WidgetRef widgetRef}) {
  switch (type) {
    case ReviewViewModelType.business:
      return BusinessReviewViewModel(widgetRef);
    case ReviewViewModelType.offer:
      return OfferReviewViewModel(widgetRef);
    case ReviewViewModelType.user:
      return UserReviewViewModel(widgetRef);
  }
}
