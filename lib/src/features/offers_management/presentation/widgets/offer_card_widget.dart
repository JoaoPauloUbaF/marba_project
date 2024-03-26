import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_edition/offer_edition_controller.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

import '../../application/offer_card/offer_card.controller.dart';

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
          color: Theme.of(context).colorScheme.primaryContainer,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = constraints.maxWidth;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "R\$${offer.price.toStringAsFixed(2)}",
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              offer.product != null
                                  ? Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${offer.availableQuantity} disponíveis",
                                        style: textTheme.labelSmall,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        FutureBuilder(
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
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OfferQuickManageWidget extends StatelessWidget {
  const OfferQuickManageWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Consumer(
            builder: (_, WidgetRef ref, __) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          showCloseIcon: true,
                          duration: const Duration(seconds: 5),
                          backgroundColor: Theme.of(context).colorScheme.error,
                          content: const Text(
                              'Tem certeza que deseja excluir a oferta?'),
                          action: SnackBarAction(
                            label: 'Sim',
                            onPressed: () {
                              ref
                                  .read(offersDataRepositoryProvider)
                                  .deleteOffer(offer.id);
                            },
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      ref
                          .read(offerEditionControllerProvider.notifier)
                          .setSelectedOfferToEdit(offer);

                      Navigator.of(context).pushNamed(
                        '/edit-offer',
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.secondary,
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
