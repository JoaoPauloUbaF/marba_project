import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/image_picker/application/image_field_controller.dart';
import '../components/add_business_stepper_widget.dart';
import '../components/user_business_list_widget.dart';

class MyBusinessListScreen extends ConsumerWidget {
  final bool shouldRenderAppBar;

  const MyBusinessListScreen({super.key, required this.shouldRenderAppBar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: shouldRenderAppBar
          ? AppBar(
              title: const Text('Meus Empreendimentos'),
            )
          : null,
      body: const UserBusinessListWidget(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetAnimationCurve: Curves.easeInOut,
                  insetAnimationDuration: const Duration(milliseconds: 500),
                  insetPadding: EdgeInsets.only(
                    top: AppBar().preferredSize.height,
                    left: 16,
                    right: 16,
                  ),
                  child: const AddBusinessStepperWidget(),
                );
              },
            ).then((value) => ref.invalidate(imageFieldControllerProvider));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
