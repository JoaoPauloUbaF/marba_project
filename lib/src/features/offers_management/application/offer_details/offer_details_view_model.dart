import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../business/application/business_profile_view_model/business_profile_screen_controller.dart';

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

  Future<void> setSelectedOfferFromId(String offerId) async {
    await ref
        .read(offersDataRepositoryProvider)
        .getOffer(offerId)
        .then((value) => state = value);
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
        .isThisBusinessOwner(businessId: businessId);
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

  Future<void> addOfferToUserFavorites() async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null || state == null) return;
    ref.read(userProfileDataProvider).addFavoriteOfferId(
          uid: user.uid,
          offerId: state?.id ?? '',
        );
  }

  Future<void> removeOfferFromUserFavorites() async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null || state == null) return;
    ref.read(userProfileDataProvider).removeFavoriteOfferId(
          uid: user.uid,
          offerId: state?.id ?? '',
        );
  }

  Future<void> onFavoriteOfferPressed() async {
    final isFavorite = await isFavoriteOffer();
    if (isFavorite) {
      await removeOfferFromUserFavorites();
    } else {
      await addOfferToUserFavorites();
    }
  }

  Future<bool> isFavoriteOffer() async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null || state == null) return false;
    final favoriteOfferIds = await ref
        .read(userProfileDataProvider)
        .getFavoriteOfferIds(uid: user.uid);
    return favoriteOfferIds.contains(state?.id);
  }
}

@riverpod
Stream<List<OfferModel>> otherBusinessOffers(
    OtherBusinessOffersRef ref, String businessId) {
  return ref
      .read(offersDataRepositoryProvider)
      .getOffersByBusinessId(businessId);
}
