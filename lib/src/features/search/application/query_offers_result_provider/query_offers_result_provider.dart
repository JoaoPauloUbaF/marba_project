import 'dart:developer';

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
      final offers = await ref
          .read(offersDataRepositoryProvider)
          .queryOffers(queryStr: queryStr);
      if (offers == null) {
        return [];
      }
      state = AsyncValue.data(offers);
      return offers;
    } catch (e, stackTrace) {
      log('Error querying offers: $e', stackTrace: stackTrace);
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }
}
