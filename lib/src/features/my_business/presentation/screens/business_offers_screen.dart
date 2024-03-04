import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/create_offer_stepper_widget.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

import '../../../offers_management/data/offer_data_repository_provider.dart';
import '../../application/my_business_offers_screen_controller/my_business_offers_screen_controller.dart';

class MyBusinessOffersScreen extends ConsumerWidget {
  const MyBusinessOffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileScreenControllerProvider);
    final offerRepo = ref.watch(offerRepositoryProviderProvider);
    final myBusinessOfferScreenController =
        ref.read(myBusinessOffersScreenControllerProvider.notifier);
    myBusinessOfferScreenController.fetchBusinessOffers(business?.id ?? '');
    final offers = ref.watch(businessOffersProviderProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.network(
                        offers[index].product?.imageUrl ?? '',
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Text(offers[index].product?.title ?? ''),
                      Text(offers[index].product?.description ?? ''),
                    ],
                  )
                ],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                insetPadding: EdgeInsets.only(
                  top: AppBar().preferredSize.height,
                  left: 16,
                  right: 16,
                ),
                child: const CreateOfferStepperWidget(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
