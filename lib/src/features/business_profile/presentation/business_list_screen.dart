import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'components/add_business_stepper_widget.dart';

class BusinessListScreen extends ConsumerWidget {
  const BusinessListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business List'),
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
                child: AddBusinessStepperWidget(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
