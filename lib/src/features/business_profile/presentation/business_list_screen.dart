import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'components/add_business_stepper_widget.dart';

class BusinessListScreen extends ConsumerWidget {
  const BusinessListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Empreendimentos'),
      ),
      body: ListView(
        children: [
          // TODO: Add business list items here
        ],
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
                child:
                    AddBusinessStepperWidget(), //TODO: Business screen controller
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
