import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'feed_offers_type_filter_provider.dart';
import 'offer_product_category_filter_provider.dart';
import 'offer_service_category_filter_provider.dart';

part 'offer_list_general_filter_provider.g.dart';

@riverpod
class OfferListFilter extends _$OfferListFilter {
  @override
  Future<bool> build() {
    ref.watch(feedOffersTypeFilterProvider);
    ref.watch(productCategoryFilterProvider);
    ref.watch(serviceCategoryFilterProvider);
    return Future.value(true);
  }
}
