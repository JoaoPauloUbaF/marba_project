import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_controller.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../business/data/business_profile_data/business_profile_provider.dart';

part 'offer_card.controller.g.dart';

@Riverpod(keepAlive: true)
class OfferCardController extends _$OfferCardController {
  @override
  void build() {}

  Future<void> onCardTap(OfferModel offer, BuildContext context) async {
    final offerBusiness = await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: offer.businessId);

    ref
        .read(businessProfileScreenControllerProvider.notifier)
        .setSelectedBusiness(offerBusiness!);

    ref.read(offerDetailsControllerProvider.notifier).setSelectedOffer(offer);
  }

  Future<bool> shouldShowOfferActions(String businessId) async {
    return await ref
        .read(businessProfileScreenControllerProvider.notifier)
        .isBusinessOwner(businessId);
  }
}
