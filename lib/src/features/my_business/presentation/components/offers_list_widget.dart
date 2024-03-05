import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/data/business_offers_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card_widget.dart';

class BusinessOfferListWidget extends ConsumerWidget {
  const BusinessOfferListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerList = ref.watch(businessOffersProvider);
    return offerList.when(
      data: (offers) {
        return GridView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return LayoutBuilder(
              builder: (context, constraints) {
                double itemWidth = constraints.maxWidth;
                double itemHeight = itemWidth / 2; // half the width

                return SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: OfferCardWidget(offer: offers[index]),
                );
              },
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
