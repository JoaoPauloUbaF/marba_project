import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_offers_provider.g.dart';

@riverpod
class BusinessOffers extends _$BusinessOffers {
  @override
  Stream<List<OfferModel>> build() {
    final business = ref.read(businessProfileScreenControllerProvider);
    if (business?.id == null) {
      return const Stream.empty();
    }
    final offers = ref.read(offersDataRepositoryProvider).getOffersByBusinessId(
          ref.read(businessProfileScreenControllerProvider)!.id,
        );
    return offers;
  }

  Future<List<OfferModel>> fetchNewOffers({OfferModel? lastOffer}) async {
    final fetchedOffers =
        ref.read(offersDataRepositoryProvider).getOffersByBusinessId(
              ref.read(businessProfileScreenControllerProvider)!.id,
              lastOffer: lastOffer,
            );
    final newOffers = await fetchedOffers.first;
    return newOffers;
  }
}
