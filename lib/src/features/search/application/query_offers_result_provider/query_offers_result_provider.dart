import 'dart:developer';

import 'package:project_marba/src/features/location_management/application/current_location_provider/current_location_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../offers_management/data/offer_data_repository_provider.dart';
part 'query_offers_result_provider.g.dart';

@Riverpod(keepAlive: true)
class QueryOffersResult extends _$QueryOffersResult {
  @override
  Future<List<OfferModel>> build() {
    return Future.value([]);
  }

  Future<List<OfferModel>>? queryOffers({required String queryStr}) async {
    try {
      final currentLocationCity = ref.read(currentLocationProvider).hasValue
          ? ref.read(currentLocationProvider).requireValue?.city
          : '';
      final offers = await ref
          .read(offersDataRepositoryProvider)
          .queryOffers(queryStr: queryStr, city: currentLocationCity ?? '');
      state = AsyncValue.data(offers);
      return offers;
    } catch (e, stackTrace) {
      log('Error querying offers: $e', stackTrace: stackTrace);
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }
}
