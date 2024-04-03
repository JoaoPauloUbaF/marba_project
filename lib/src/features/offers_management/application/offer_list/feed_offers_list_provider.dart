import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';

part 'feed_offers_list_provider.g.dart';

@riverpod
class FeedOffers extends _$FeedOffers {
  @override
  Stream<List<OfferModel>> build() {
    final offers = ref.read(offersDataRepositoryProvider).getOffers();
    return offers;
  }

  Future<List<OfferModel>> fetchNewOffers({OfferModel? lastOffer}) async {
    final fetchedOffers =
        ref.read(offersDataRepositoryProvider).getOffers(lastOffer: lastOffer);
    final newOffers = await fetchedOffers.first;
    return newOffers;
  }
}
