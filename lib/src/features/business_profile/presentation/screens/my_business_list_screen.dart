import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business_profile/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:project_marba/src/features/business_profile/data/business_list_provider/business_list_provider.dart';

import '../../../../shared/models/business/business.dart';
import '../components/add_business_stepper_widget.dart';

class MyBusinessListScreen extends ConsumerWidget {
  const MyBusinessListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userBusinessList = ref.watch(ownedBusinessProvider);
    final myBusinessListController =
        ref.read(myBusinessListScreenControllerProvider.notifier);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Empreendimentos'),
      ),
      body: FutureBuilder<List<Business?>>(
        future: userBusinessList.when(
          data: (data) => Future.value(data),
          loading: () => Future.value([]),
          error: (error, stackTrace) => Future.error(error),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final business = snapshot.data![index];
                return ListTile(
                  title: Text(business?.name ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => {
                      myBusinessListController.deleteBusiness(
                        businessId: business?.id ?? '',
                      ),
                    },
                  ),
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
