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
          double cardHeight = constraints.maxHeight / 1.5; // half the width

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: cardWidth,
                height: cardHeight, // half the width
                child: Image.network(
                  offer.imageUrl,
                  fit: BoxFit.fill,
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer.title,
                          style: textTheme.titleLarge, // Use headline6 style
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$ ${offer.price.toStringAsFixed(2)}",
                              style:
                                  textTheme.labelLarge, // Use bodyText2 style
                            ),
                            const VerticalDivider(),
                            offer.product != null
                                ? Text(
                                    "Qtd: ${offer.availableQuantity}",
                                    style: textTheme
                                        .labelLarge, // Use bodyText2 style
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const IconButton(onPressed: null, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
