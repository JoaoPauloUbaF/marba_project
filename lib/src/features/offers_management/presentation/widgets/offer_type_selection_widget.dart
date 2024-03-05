import 'package:flutter/material.dart';

class OfferTypeSelection extends StatefulWidget {
  final Function(String) onTypeSelected;

  const OfferTypeSelection({Key? key, required this.onTypeSelected})
      : super(key: key);

  @override
  _OfferTypeSelectionState createState() => _OfferTypeSelectionState();
}

class _OfferTypeSelectionState extends State<OfferTypeSelection> {
  String _selectedType = '';

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
                    color: _selectedType == 'product'
                        ? Colors.orange
                        : Colors.grey,
                    size: 50, // Change colors as needed
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedType = 'product';
                    });
                    widget.onTypeSelected(_selectedType);
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
                color: _selectedType == 'service' ? Colors.orange : Colors.grey,
                size: 50, // Change colors as needed
              ),
              onPressed: () {
                setState(() {
                  _selectedType = 'service';
                });
                widget.onTypeSelected(_selectedType);
              },
            ),
            const Text('Serviço'),
          ],
        ),
      ],
    );
  }
}
