import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/create_offer_stepper_widget.dart';

class MyBusinessOffersScreen extends StatelessWidget {
  const MyBusinessOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        BusinessOfferListWidget(),
      ]),
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
      ),
    );
  }
}
