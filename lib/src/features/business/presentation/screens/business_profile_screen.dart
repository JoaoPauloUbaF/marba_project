import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_info_card_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile_image_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_status_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileViewModelProvider);
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);

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
                  Visibility(
                    visible: business?.address != null,
                    child: AddressDisplayWidget(
                      address: business!.address,
                      isEditable: true,
                      isBusinessAddress: true,
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
