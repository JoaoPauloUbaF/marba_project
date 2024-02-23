import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/business/business.dart';
import '../../application/my_business_list_screen_controller/my_business_list_screen_controller.dart';

class UserBusinessListWidget extends ConsumerWidget {
  const UserBusinessListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myBusinessListController =
        ref.read(myBusinessListScreenControllerProvider.notifier);
    final testProvider = ref.watch(myBusinessListScreenControllerProvider);

    return FutureBuilder<List<Business?>>(
      // b
      future: testProvider.when(
        data: (data) => Future.value(data),
        loading: () => Future.delayed(const Duration(seconds: 10), () => []),
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
                  icon: const Icon(Icons.delete),
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
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
