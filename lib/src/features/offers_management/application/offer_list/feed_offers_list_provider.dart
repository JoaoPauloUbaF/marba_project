import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../location_management/application/current_location_provider/current_location_provider.dart';

part 'feed_offers_list_provider.g.dart';

@riverpod
class FeedOffers extends _$FeedOffers {
  @override
  Stream<List<OfferModel>> build() {
    final offers = ref.read(offersDataRepositoryProvider).getOffers();
    return offers;
  }

  Future<List<OfferModel>> fetchNewOffers({OfferModel? lastOffer}) async {
    final currentLocation = ref.watch(currentLocationProvider);
    return currentLocation.when(data: (address) async {
      if (address?.city == null || address == null) {
        return [];
      }

      return ref
          .read(offersDataRepositoryProvider)
          .getOffersAt(lastOffer: lastOffer, city: address.city);
    }, loading: () {
      state = const AsyncValue.loading();
      return [];
    }, error: (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return [];
    });
  }
}
