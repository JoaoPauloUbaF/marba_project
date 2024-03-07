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
        return MasonryGridView.count(
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return OfferCardWidget(offer: offers[index]);
          },
          itemCount: offers.length,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );

        // return Center(
        //   child: Wrap(
        //     direction: Axis.horizontal,
        //     children: offers.map((offer) {
        //       return OfferCardWidget(offer: offer);
        //     }).toList(),
        //   ),
        // );

        // GridView.builder(
        //   itemCount: offers.length,
        //   itemBuilder: (context, index) {
        //     return LayoutBuilder(
        //       builder: (context, constraints) {
        //         double itemWidth = constraints.maxWidth;
        //         double itemHeight = itemWidth / 2; // half the width

        //         return SizedBox(
        //           width: itemWidth,
        //           height: itemHeight,
        //           child: OfferCardWidget(offer: offers[index]),
        //         );
        //       },
        //     );
        //   },
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 4.0,
        //     mainAxisSpacing: 4.0,
        //   ),
        //   controller: ScrollController(keepScrollOffset: false),
        // );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
