import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';

class BusinessProfileViewModel {
  final WidgetRef ref;

  const BusinessProfileViewModel({
    required this.ref,
  });

  // ReviewModel getReviewModel() {
  //   return ReviewModel.business(
  //     id: '1',
  //     businessId: '1',
  //     userId: '1',
  //     rating: 5,
  //     review: 'Great business!',
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //   );
  // }
}
