import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferTypeSelection extends StatefulWidget {
  final Function(OfferType) onTypeSelected;

  const OfferTypeSelection({super.key, required this.onTypeSelected});

  @override
  OfferTypeSelectionState createState() => OfferTypeSelectionState();
}

class OfferTypeSelectionState extends State<OfferTypeSelection> {
  OfferType? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_sharp,
                    color: _selectedType == OfferType.product
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).disabledColor,
                    size: 50, // Change colors as needed
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedType = OfferType.product;
                    });
                    widget.onTypeSelected(_selectedType!);
                  },
                ),
              ],
            ),
            const Text('Produto'),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.build_sharp,
                color: _selectedType == OfferType.service
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).disabledColor,
                size: 50, // Change colors as needed
              ),
              onPressed: () {
                setState(() {
                  _selectedType = OfferType.service;
                });
                widget.onTypeSelected(_selectedType!);
              },
            ),
            const Text('Serviço'),
          ],
        ),
      ],
    );
  }
}
