import 'package:flutter/material.dart';

class OfferErrorWidget extends StatelessWidget {
  const OfferErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              'Houve um erro ao carregar a oferta.\n      Tente novamente mais tarde.'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Retornar'),
            ),
          ),
        ],
      ),
    ));
  }
}
