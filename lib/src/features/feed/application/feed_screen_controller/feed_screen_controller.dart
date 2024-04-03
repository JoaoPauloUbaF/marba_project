import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/business/enums.dart';
import '../../../../core/models/product/enums.dart';
import '../../../../core/models/service/enums.dart';

part 'feed_screen_controller.g.dart';

@riverpod
class FeedScreenController extends _$FeedScreenController {
  @override
  FutureOr<void> build() {}

  void onOfferSelected(OfferModel offer) {}

  List<BusinessCategory> getCategories() {
    return [];
  }

  List<ProductCategory> getProductCategories() {
    return [];
  }

  List<ServiceCategory> getServiceCategories() {
    return [];
  }
}
