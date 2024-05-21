import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_view_model.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_card_widget.dart';

class OtherBusinessOffersWidget extends ConsumerWidget {
  const OtherBusinessOffersWidget({
    super.key,
    required this.offerId,
    required this.businessId,
  });

  final String? offerId;
  final String? businessId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moreBusinessOffers = ref.watch(
      otherBusinessOffersProvider(businessId ?? ''),
    );
    return Container(
      child: moreBusinessOffers.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (businessOffers) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var businessOffer
                  in businessOffers.where((element) => element.id != offerId))
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: OfferCardWidget(
                    offer: businessOffer,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
