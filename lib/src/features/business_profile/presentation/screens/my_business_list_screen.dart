import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/business_profile/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';

import '../../../../shared/models/business/business.dart';
import '../components/add_business_stepper_widget.dart';

class MyBusinessListScreen extends ConsumerWidget {
  const MyBusinessListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.read(myBusinessListScreenControllerProvider);
    final myBusinessListController =
        ref.read(myBusinessListScreenControllerProvider.notifier);
    final userRepository = ref.read(userProfileDataProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final formKey = GlobalKey<FormState>();

    final ownedBusinessList = userRepository.getOwnedBusinessIds(
        uid: authRepository.getCurrentUser()?.uid ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Empreendimentos'),
      ),
      body: FutureBuilder<List<Business?>>(
        future: myBusinessListController.getMyBusinessList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final business = snapshot.data![index];
                return ListTile(
                  title: Text(business!.name),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
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
                child: AddBusinessStepperWidget(
                  myBusinessListController: myBusinessListController,
                  formKey: formKey,
                ), //TODO: Business screen controller
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
