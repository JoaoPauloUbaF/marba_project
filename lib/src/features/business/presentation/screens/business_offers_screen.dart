import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/create_offer_stepper_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_filter_widget.dart';

import '../../application/business_profile_screen_controller/business_profile_screen_controller.dart';

class MyBusinessOffersScreen extends ConsumerWidget {
  const MyBusinessOffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);
    final business = ref.watch(businessProfileScreenControllerProvider);
    final isOwner = ref
        .read(businessProfileScreenControllerProvider.notifier)
        .isBusinessOwner(business?.id ?? '');

    return Scaffold(
      body: NestedScrollView(
        body: OfferListWidget(
          offerProvider: businessOffers,
          offerProviderNotifier: businessOffersNotifier,
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(
              child: OfferTypeFilterWidget(),
            ),
          ];
        },
      ),
      floatingActionButton: FutureBuilder(
        future: isOwner,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.onError,
                  content: Text(snapshot.error.toString()),
                ),
              );
              return const SizedBox.shrink();
            } else {
              return snapshot.data == true
                  ? FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
                    )
                  : const SizedBox();
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
