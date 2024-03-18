import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_controller.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_card.controller.g.dart';

@Riverpod(keepAlive: true)
class OfferCardController extends _$OfferCardController {
  @override
  void build() {}

  void onCardTap(OfferModel offer, BuildContext context) {
    ref.read(offerDetailsControllerProvider.notifier).setSelectedOffer(offer);
    Navigator.of(context).pushNamed(
      '/offer-details',
    );
  }

  Future<bool> shouldShowOfferActions() async {
    return await ref
        .read(businessProfileScreenControllerProvider.notifier)
        .isBusinessOwner();
  }
}
