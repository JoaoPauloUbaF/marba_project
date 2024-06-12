import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/business/enums.dart';
import '../../../../core/models/product/enums.dart';
import '../../../../core/models/service/enums.dart';

part 'feed_view_model.g.dart';

@riverpod
class FeedViewModel extends _$FeedViewModel {
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

  FutureOr<void> filterOffers(String value) {}
}
