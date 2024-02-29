import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/create_offer_stepper_widget.dart';

class MyBusinessOffersScreen extends StatelessWidget {
  const MyBusinessOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            final offer = offers[index];
            return ListTile(
              title: Text(offer.title),
              subtitle: Text(offer.description),
              trailing: Text('\$${offer.price.toStringAsFixed(2)}'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: EdgeInsets.only(
                    top: AppBar().preferredSize.height,
                    left: 16,
                    right: 16,
                  ),
                  child: const CreateOfferStepperWidget(),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}

class Offer {
  final String title;
  final String description;
  final double price;

  Offer({
    required this.title,
    required this.description,
    required this.price,
  });
}

final List<Offer> offers = [
  Offer(
    title: 'Offer 1',
    description: 'Description of Offer 1',
    price: 9.99,
  ),
  Offer(
    title: 'Offer 2',
    description: 'Description of Offer 2',
    price: 19.99,
  ),
  Offer(
    title: 'Offer 3',
    description: 'Description of Offer 3',
    price: 29.99,
  ),
];
