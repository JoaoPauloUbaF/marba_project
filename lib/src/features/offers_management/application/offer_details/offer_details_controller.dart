import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';

part 'offer_details_controller.g.dart';

@Riverpod(keepAlive: true)
class OfferDetailsController extends _$OfferDetailsController {
  @override
  OfferModel? build() {
    return null;
  }

  void setSelectedOffer(OfferModel offer) {
    state = offer;
  }

  Set<String> getOfferMedia() {
    Set<String> media = {};
    media.add(state?.imageUrl ?? '');
    media = {...media, ...state?.offerImagesUrls ?? {}};
    return media;
  }

  Stream<List<OfferModel>> getMoreBusinessOffers() {
    return ref
        .read(offersDataRepositoryProvider)
        .getOffersByBusinessId(state?.businessId ?? '');
  }
}

@riverpod
Stream<List<OfferModel>> otherBusinessOffers(
    OtherBusinessOffersRef ref, String businessId) {
  return ref
      .read(offersDataRepositoryProvider)
      .getOffersByBusinessId(businessId);
}
