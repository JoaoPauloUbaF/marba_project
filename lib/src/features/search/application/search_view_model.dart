import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/business/business.dart';
import '../../../core/models/offer/offer_model.dart';
part 'search_view_model.g.dart';

@riverpod
class SearchViewModel extends _$SearchViewModel {
  @override
  FutureOr<void> build() {}

  Future<List<OfferModel>> getHotOffers() async {
    final offers =
        await ref.read(offersDataRepositoryProvider).getOffers().take(5).first;
    return offers;
  }

  Future<List<Business>> getHotBusinesses() async {
    final businesses = await ref
        .read(businessProfileDataProvider)
        .getBusinessesAt(city: 'Lavras');
    if (businesses == null) {
      return [];
    }
    return businesses.take(5).toList();
  }
}
