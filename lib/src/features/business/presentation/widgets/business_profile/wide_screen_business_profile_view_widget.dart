import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_info_card_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_profile_image_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_status_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offers_list_widget.dart';

class WideScreenBusinessProfileViewWidget extends StatelessWidget {
  const WideScreenBusinessProfileViewWidget({
    super.key,
    required this.businessOffers,
    required this.businessOffersNotifier,
    required this.business,
  });

  final AsyncValue<List<OfferModel>> businessOffers;
  final BusinessOffers businessOffersNotifier;
  final BusinessModel? business;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Stack(
                  children: [
                    BusinessProfileImageWidget(
                      size: 80,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: BusinessStatusWidget(),
                    ),
                  ],
                ),
                const BusinessContactInfoCardWidget(),
                business?.address == null
                    ? const SizedBox.shrink()
                    : AddressDisplayWidget(
                        address: business!.address,
                        isEditable: true,
                        isBusinessAddress: true,
                      ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: OfferListWidget(
              offerProvider: businessOffers,
              offerProviderNotifier: businessOffersNotifier),
        ),
      ],
    );
  }
}
