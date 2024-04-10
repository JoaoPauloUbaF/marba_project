import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/core/models/service/enums.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';

class OfferPriceWidget extends StatelessWidget {
  const OfferPriceWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    final double offerPrice = offer.price;
    final double offerDiscount = offer.discountValue;
    final double offerPriceWithDiscount =
        offerPrice - (offerPrice * offerDiscount / 100);
    final bool isHourly = offer.offerType == OfferType.service &&
        offer.serviceOffer?.pricingType == ServicePricingType.hourly;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: offerDiscount != 0,
                child: Text(
                  RegistrationUtils().formatAsCurrency(offerPrice),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
              Row(
                children: [
                  Text(
                    RegistrationUtils()
                        .formatAsCurrency(offerPriceWithDiscount),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  isHourly
                      ? Text(
                          " /h",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Visibility(
            visible: offerDiscount != 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                '${offerDiscount.toStringAsFixed(0)}% OFF',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const Spacer(),
          if (offer.availableQuantity != null)
            Text("${offer.availableQuantity} unidades disponíveis",
                style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
