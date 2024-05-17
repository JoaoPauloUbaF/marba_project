import 'dart:developer';

import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_business_result_provider.g.dart';

@Riverpod(keepAlive: true)
class QueryBusinessResult extends _$QueryBusinessResult {
  @override
  Future<List<BusinessModel>> build() {
    return Future.value([]);
  }

  Future<List<BusinessModel>>? queryBusinessesAt(
      {required String queryStr}) async {
    //TODO: apply location
    try {
      final businesses = await ref
          .read(businessProfileDataProvider)
          .queryBusinessAt(queryStr: queryStr, city: 'Lavras');
      if (businesses == null) {
        return [];
      }
      state = AsyncValue.data(businesses);
      return businesses;
    } catch (e, stackTrace) {
      log('Error querying offers: $e', stackTrace: stackTrace);
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }
}