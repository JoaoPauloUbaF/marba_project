import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_view_model.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../business/data/business_profile_data/business_profile_provider.dart';

part 'offer_card_view_model.g.dart';

@Riverpod(keepAlive: true)
class OfferCardViewModel extends _$OfferCardViewModel {
  @override
  void build() {}

  Future<void> onCardTap(OfferModel offer, BuildContext context) async {
    final offerBusiness = await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: offer.businessId);

    ref
        .read(businessProfileViewModelProvider.notifier)
        .setSelectedBusiness(offerBusiness!);

    ref.read(offerDetailsViewModelProvider.notifier).setSelectedOffer(offer);
  }

  Future<bool> shouldShowOfferActions(String businessId) async {
    return await ref
        .read(businessProfileViewModelProvider.notifier)
        .isThisBusinessOwner(businessId: businessId);
  }
}
