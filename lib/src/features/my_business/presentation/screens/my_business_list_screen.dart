import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import '../components/add_business_stepper_widget.dart';
import '../components/user_business_list_widget.dart';

class MyBusinessListScreen extends ConsumerWidget {
  const MyBusinessListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myBusinessListController =
        ref.read(myBusinessListScreenControllerProvider.notifier);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Empreendimentos'),
      ),
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
                child: AddBusinessStepperWidget(
                  myBusinessListController: myBusinessListController,
                  formKey: formKey,
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
