import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_category_tiles_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_delivery_info_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_opening_hours_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_profile_image_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_review_card_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_status_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offers_list_widget.dart';

import '../../../../location_management/presentation/widgets/address_display_widget.dart';
import 'business_info_card_widget.dart';

class MobileBusinessProfileViewWidget extends StatelessWidget {
  const MobileBusinessProfileViewWidget({
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
    return NestedScrollView(
      body: OfferListWidget(
        //TODO: implementar melhores ofertas
        offerProvider: businessOffers,
        offerProviderNotifier: businessOffersNotifier,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(8),
                  const SizedBox(
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        BusinessProfileImageWidget(size: 80),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: BusinessStatusWidget(),
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  BusinessCategoryTilesWidget(),
                  const Gap(4),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BusinessReviewCardWidget(),
                      Gap(4),
                      BusinessDeliveryInfoWidget(),
                    ],
                  ),
                  const BusinessOpeningHoursWidget(),
                  Card(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text(
                          'Contato e Endereço',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        children: <Widget>[
                          const BusinessContactInfoCardWidget(),
                          const Gap(4),
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
                ],
              ),
            ),
          ),
          const SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Melhores Ofertas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
