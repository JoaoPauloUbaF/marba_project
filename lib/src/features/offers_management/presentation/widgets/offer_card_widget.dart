import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferCardWidget extends StatelessWidget {
  final OfferModel offer;

  const OfferCardWidget({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Access text theme

    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.onPrimary,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cardWidth = constraints.maxWidth;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
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
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.title,
                              style: textTheme.titleMedium,
                              maxLines: 2, // Adjust number of lines
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "R\$ ${offer.price.toStringAsFixed(2)}",
                                style: textTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Add space between widgets
                            offer.product != null
                                ? Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Qtd: ${offer.availableQuantity}",
                                      style: textTheme.labelMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryIconTheme.color,
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
