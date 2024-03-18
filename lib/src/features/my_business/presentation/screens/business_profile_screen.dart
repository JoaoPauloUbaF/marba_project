import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/location_management/presentation/address_display_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_info_card.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_profile_image_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_status_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/loading_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileScreenControllerProvider);
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(businessProfileScreenControllerProvider.notifier)
              .fetchBusinessProfile();
        },
        child: NestedScrollView(
          body: OfferListWidget(
            offerProvider: businessOffers,
            offerProviderNotifier: businessOffersNotifier,
            isBusiness: true, //TODO: Change this to consume a provider
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: business != null
                    ? Column(
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
                          const BusinessContactInfoCard(),
                          AddressDisplayWidget(address: business.address),
                        ],
                      )
                    : const LoadingWidget(),
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
        ),
      ),
    );
  }
}
