import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

part 'offer_details_view_model.g.dart';

@Riverpod(keepAlive: true)
class OfferDetailsViewModel extends _$OfferDetailsViewModel {
  @override
  OfferModel? build() {
    return null;
  }

  void setSelectedOffer(OfferModel offer) {
    state = offer;
  }

  Set<String> getOfferMedia() {
    Set<String> media = {};
    media.add(state?.getImageUrl ?? '');
    media = {...media, ...state?.offerImagesUrls ?? {}};
    return media;
  }

  Stream<List<OfferModel>> getMoreBusinessOffers() {
    return ref
        .read(offersDataRepositoryProvider)
        .getOffersByBusinessId(state?.businessId ?? '');
  }

  Future<bool> isOfferOwner(String businessId) async {
    return await ref
        .read(businessProfileViewModelProvider.notifier)
        .isBusinessOwner(businessId: businessId);
  }

  Future<void> updateOfferTitle(
      {required String offerId, required String newTitle}) async {
    OfferModel? newOffer;
    if (state?.type == OfferType.product) {
      newOffer = state?.copyWith(title: newTitle);
    } else {
      newOffer = state?.copyWith(title: newTitle);
    }
    if (newOffer != null) {
      ref.read(offersDataRepositoryProvider).updateOffer(newOffer).then(
            (value) => ref
                .read(offersDataRepositoryProvider)
                .getOffer(offerId)
                .then((value) => state = value),
          );
    }
  }
}

@riverpod
Stream<List<OfferModel>> otherBusinessOffers(
    OtherBusinessOffersRef ref, String businessId) {
  return ref
      .read(offersDataRepositoryProvider)
      .getOffersByBusinessId(businessId);
}
