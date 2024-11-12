import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/business/enums.dart';
import '../../../../core/models/product/enums.dart';
import '../../../../core/models/service/enums.dart';
import '../../../offers_management/application/offer_list/feed_offers_list_provider.dart';

part 'feed_view_model.g.dart';

@riverpod
class FeedViewModel extends _$FeedViewModel {
  @override
  FutureOr<void> build() {}

  void onOfferSelected(OfferModel offer) {}

  List<BusinessCategory> getPopularCategories() {
    return [
      BusinessCategory.appliances,
      BusinessCategory.artsAndCrafts,
      BusinessCategory.automotive,
      BusinessCategory.beautyAndPersonalCare,
      BusinessCategory.booksAndStationery,
      BusinessCategory.clothing,
      BusinessCategory.electronics,
      BusinessCategory.healthAndWellness,
      BusinessCategory.homeAndGarden,
    ];
  }

  List<ProductCategory> getProductCategories() {
    return [];
  }

  List<ServiceCategory> getPopularServices() {
    return [
      ServiceCategory.accountant,
      ServiceCategory.architect,
      ServiceCategory.cleaner,
      ServiceCategory.computerRepair,
      ServiceCategory.electrician,
      ServiceCategory.plumber,
      ServiceCategory.elderCareProvider,
    ];
  }

  FutureOr<void> filterOffers(String value) {}

  AsyncValue<List<OfferModel>> feedOffers() {
    return ref.watch(feedOffersProvider);
  }
}
