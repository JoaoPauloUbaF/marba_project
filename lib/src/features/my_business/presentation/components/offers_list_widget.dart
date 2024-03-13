import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_marba/src/features/offers_management/data/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card_widget.dart';

class BusinessOfferListWidget extends ConsumerWidget {
  const BusinessOfferListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerList = ref.watch(businessOffersProvider);
    return offerList.when(
      data: (offers) {
        if (offers.isEmpty) {
          return const Center(
              child: Text('Esse negócio AINDA não tem ofertas disponíveis.'));
        }
        return MasonryGridView.count(
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            print(offers[0].toJson());
            return OfferCardWidget(offer: offers[index]);
          },
          itemCount: offers.length,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
