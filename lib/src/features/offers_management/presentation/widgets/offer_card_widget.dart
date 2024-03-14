import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_edition/offer_edition_controller.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferCardWidget extends StatelessWidget {
  final OfferModel offer;

  const OfferCardWidget({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Access text theme

    return SizedBox(
      width: Theme.of(context).platform == TargetPlatform.iOS ||
              Theme.of(context).platform == TargetPlatform.android
          ? MediaQuery.of(context).size.width / 2.2
          : MediaQuery.of(context).size.width / 3.1,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).colorScheme.onPrimary,
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
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.title,
                              style: textTheme.titleMedium,
                              maxLines: 2, // Adjust number of lines
                            ),
                            Text(
                              "R\$ ${offer.price.toStringAsFixed(2)}",
                              style: textTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Add space between widgets
                            offer.product != null
                                ? Text(
                                    "Qtd: ${offer.availableQuantity}",
                                    style: textTheme.labelMedium,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Consumer(
                          builder: (_, WidgetRef ref, __) {
                            return Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          showCloseIcon: true,
                                          duration: const Duration(seconds: 5),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .error,
                                          content: const Text(
                                              'Tem certeza que deseja excluir a oferta?'),
                                          action: SnackBarAction(
                                            label: 'Sim',
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      offerRepositoryProviderProvider)
                                                  .deleteOffer(offer.id);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(offerEditionControllerProvider
                                              .notifier)
                                          .setSelectedOfferToEdit(offer);

                                      Navigator.of(context).pushNamed(
                                        '/edit-offer',
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
