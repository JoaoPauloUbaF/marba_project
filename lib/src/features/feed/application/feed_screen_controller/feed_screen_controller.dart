import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/business/enums.dart';
import '../../../../shared/models/product/enums.dart';
import '../../../../shared/models/service/enums.dart';

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
