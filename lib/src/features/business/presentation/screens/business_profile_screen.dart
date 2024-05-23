import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_info_card_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_profile_image_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/business_status_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileViewModelProvider);
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);

    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return !isWideScreen
        ? MobileBusinessProfileViewWidget(
            businessOffers: businessOffers,
            businessOffersNotifier: businessOffersNotifier,
            business: business)
        : WideScreenBusinessProfileViewWidget(
            businessOffers: businessOffers,
            businessOffersNotifier: businessOffersNotifier,
            business: business);
  }
}

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
                    BusinessProfileImageWidget(),
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
            child: Visibility(
              visible: business != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Stack(
                    children: [
                      BusinessProfileImageWidget(),
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
