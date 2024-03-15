import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/create_offer_stepper_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_type_filter_widget.dart';

class MyBusinessOffersScreen extends ConsumerWidget {
  const MyBusinessOffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);
    return Scaffold(
      body: NestedScrollView(
        body: OfferListWidget(
          offerProvider: businessOffers,
          offerProviderNotifier: businessOffersNotifier,
          isBusiness: true,
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(
              child: OfferTypeFilterWidget(),
            ),
          ];
        },
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
