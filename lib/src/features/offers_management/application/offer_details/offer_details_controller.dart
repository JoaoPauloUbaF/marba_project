import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/offer/offer_model.dart';

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
}
