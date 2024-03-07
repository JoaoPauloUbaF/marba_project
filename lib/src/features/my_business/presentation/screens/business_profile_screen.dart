import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/location_management/presentation/address_display_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_info_card.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_profile_image_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/loading_widget.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/data/business_offers_provider.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileScreenControllerProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(businessProfileScreenControllerProvider.notifier)
              .fetchBusinessProfile();
        },
        child: ListView(
          children: [
            business != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BusinessProfileImageWidget(),
                      const BusinessContactInfoCard(),
                      AddressDisplayWidget(address: business.address),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Melhores Ofertas',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const BusinessOfferListWidget()),
                    ],
                  )
                : const LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
