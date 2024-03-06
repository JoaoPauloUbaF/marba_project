import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/offer/offer_model.dart';

part 'offer_edition_controller.g.dart';

@Riverpod(keepAlive: true)
class OfferEditionController extends _$OfferEditionController {
  @override
  OfferModel? build() {
    return null;
  }

  FutureOr<void> setSelectedOfferToEdit(OfferModel offer) {
    state = offer;
  }
}
