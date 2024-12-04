import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../location_management/application/current_location_provider/current_location_provider.dart';
import '../../../offers_management/data/offer_data_repository_provider.dart';

part 'hot_offers_provider.g.dart';

@riverpod
class HotOffers extends _$HotOffers {
  @override
  Future<List<OfferModel>> build() {
    fetchHotOffers();
    return Future.value([]);
  }

  Future<void> fetchHotOffers() async {
    state = const AsyncValue.loading();
    final location =
        ref.watch(currentLocationProvider).requireValue?.city ?? '';
    final offers = await ref
        .read(offersDataRepositoryProvider)
        .getOffersAt(city: location);

    state = AsyncValue.data(offers.take(5).toList());
  }
}
