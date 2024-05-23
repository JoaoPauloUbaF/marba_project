import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_offers_screen.dart';

class AllBusinessOffersButton extends StatelessWidget {
  const AllBusinessOffersButton({
    super.key,
    required this.businessName,
  });

  final String businessName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              scrollControlDisabledMaxHeightRatio: .9,
              builder: (BuildContext context) {
                return ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Scaffold(
                        appBar: AppBar(
                          title: Text('Ofertas $businessName'),
                        ),
                        body: const MyBusinessOffersScreen()));
              });
        },
        icon: const Icon(Icons.arrow_forward_ios),
        label: const Text('Ver todas as ofertas'),
      ),
    );
  }
}
