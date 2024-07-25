import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../widgets/business_list/user_business_list_widget.dart';

class MyBusinessesView extends ConsumerWidget {
  const MyBusinessesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: const UserBusinessListWidget(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/business-create');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
