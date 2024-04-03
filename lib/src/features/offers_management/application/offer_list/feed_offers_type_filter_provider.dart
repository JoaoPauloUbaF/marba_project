import 'dart:developer';

import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_offers_type_filter_provider.g.dart';

@riverpod
class FeedOffersTypeFilter extends _$FeedOffersTypeFilter {
  @override
  OfferType? build() {
    return null;
  }

  void setOfferTypeFilter(OfferType? offerType) {
    log('OfferType: $offerType', name: 'FeedOffersTypeFilter');
    state = offerType;
  }
}
