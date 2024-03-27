import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:project_marba/src/shared/utils/registration_utils.dart';

import '../../application/offer_card/offer_card.controller.dart';
import 'offer_quick_manage_widget.dart';

class OfferCardWidget extends ConsumerWidget {
  final OfferModel offer;

  const OfferCardWidget({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme; // Access text theme
    final cardController = ref.read(offerCardControllerProvider.notifier);

    return InkWell(
      onTap: () => cardController.onCardTap(offer, context).then(
            (value) => Navigator.of(context).pushNamed(
              '/offer-details',
            ),
          ),
      child: SizedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.onSurface,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = constraints.maxWidth;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Image.network(
                      offer.imageUrl,
                      fit: BoxFit.fill,
                      width: cardWidth,
                      height: cardWidth / 1.2,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          width: cardWidth,
                          height: cardWidth / 1.2,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: FutureBuilder(
                        future: cardController
                            .shouldShowOfferActions(offer.businessId),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data
                                ? OfferQuickManageWidget(offer: offer)
                                : const SizedBox.shrink();
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        offer.title,
                        style: textTheme.titleSmall,
                        maxLines: 2,
                        overflow:
                            TextOverflow.ellipsis, // Adjust number of lines
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: offer.discount != null &&
                                  offer.discount != 0.0,
                              child: Text(
                                RegistrationUtils()
                                    .formatAsCurrency(offer.price),
                                style: textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 10,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              RegistrationUtils().formatAsCurrency(offer.price -
                                  ((offer.discount ?? 0) / 100 * offer.price)),
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Visibility(
                          visible:
                              offer.discount != null && offer.discount != 0.0,
                          child: Text(
                            "-${offer.discountValue.toStringAsFixed(0)}% ",
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.lightGreen,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: offer.availableQuantity != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Text(
                        "${offer.availableQuantity} disponíveis",
                        style: textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
