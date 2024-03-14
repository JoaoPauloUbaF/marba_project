import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../components/add_business_stepper_widget.dart';
import '../components/user_business_list_widget.dart';

class MyBusinessListScreen extends ConsumerWidget {
  final bool shouldRenderAppBar;

  const MyBusinessListScreen({Key? key, required this.shouldRenderAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: shouldRenderAppBar
          ? AppBar(
              title: const Text('Meus Empreendimentos'),
            )
          : null,
      body: const UserBusinessListWidget(),
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
                child: const AddBusinessStepperWidget(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
