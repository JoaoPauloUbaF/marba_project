import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/my_business/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/features/my_business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_info_card.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_description_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_info_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_ordering_actions_widget.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:project_marba/src/utils/mock_utils.dart';

import '../../../../shared/models/business/business.dart';
import '../../application/offer_details/offer_details_controller.dart';
import '../widgets/offer_media_widget.dart';

class OfferDetailsScreen extends ConsumerStatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  ConsumerState<OfferDetailsScreen> createState() => OfferDetailsScreenState();
}

class OfferDetailsScreenState extends ConsumerState<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final offerSelected = ref.watch(offerDetailsControllerProvider);
    final offerDetailsController =
        ref.read(offerDetailsControllerProvider.notifier);
    final items = offerDetailsController.getOfferMedia();

    bool isTest = false;
    final offer = isTest
        ? MockUtils().getMockedOfferModel()
        : offerSelected!; //TODO: default offer for testing/placeholders

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: OfferMediaWidget(
                  items: items,
                ),
              ),
              SliverToBoxAdapter(
                child: OfferInfoWidget(offer: offer),
              ),
              SliverToBoxAdapter(
                child: OfferOrderingActionsWidget(offer: offer),
              ),
              SliverToBoxAdapter(
                child: BusinessTileWidget(businessId: offer.businessId),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.secondaryContainer,
                        Theme.of(context).colorScheme.background,
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: OfferDescriptionWidget(offer: offer),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              )
            ];
          },
          body: const Placeholder(), //TODO: business offers list
        ));
  }
}

class BusinessTileWidget extends ConsumerWidget {
  const BusinessTileWidget({
    super.key,
    required this.businessId,
  });

  final String businessId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: FutureBuilder(
        future: ref
            .read(businessProfileDataProvider)
            .getBusinessProfileData(uid: businessId),
        builder: (BuildContext context, AsyncSnapshot<Business?> snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              onTap: () {
                ref
                    .read(myBusinessListScreenControllerProvider.notifier)
                    .onTapBusiness(
                        business: snapshot.data!,
                        context:
                            context); //TODO: FIX BUSINESS HOME AND PROFILE NAV
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(snapshot.data!.imageUrl!),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 12,
                              ),
                              Text(
                                '${snapshot.data!.address.city}, ${snapshot.data!.address.state}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                size: 12,
                              ),
                              Text(
                                snapshot.data!.phoneNumber,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
