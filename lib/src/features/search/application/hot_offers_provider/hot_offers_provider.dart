import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offers_management/data/offer_data_repository_provider.dart';

part 'hot_offers_provider.g.dart';

@riverpod
class HotOffers extends _$HotOffers {
  @override
  Future<List<OfferModel>> build() {
    return Future.value([]);
  }

  Future<void> fetchHotOffers() async {
    state = const AsyncValue.loading();
    Future.delayed(const Duration(seconds: 2)); // Simulate loading
    final offers =
        ref.read(offersDataRepositoryProvider).getOffers().take(5).first;

    state = AsyncValue.data(await offers);
  }
}
