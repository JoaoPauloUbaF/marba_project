import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_creation/create_offer_stepper_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_list/offer_type_filter_widget.dart';

import '../../application/business_profile_view_model/business_profile_screen_controller.dart';

class BusinessOffersView extends ConsumerWidget {
  const BusinessOffersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);
    final viewModel = ref.read(businessProfileViewModelProvider.notifier);

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
      floatingActionButton: viewModel.isOwner
          ? FloatingActionButton(
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
          : null,
    );
  }
}
