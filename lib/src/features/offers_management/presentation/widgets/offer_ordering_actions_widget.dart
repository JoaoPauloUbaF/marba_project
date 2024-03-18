import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferOrderingActionsWidget extends StatelessWidget {
  const OfferOrderingActionsWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offer.offerType == OfferType.service
                    ? Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_sharp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: Text(
                            "Comprar\nagora",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month_sharp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: Text(
                            "Agendar\n horário",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart_sharp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    label: Text(
                      "Adicionar\nao carrinho",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
