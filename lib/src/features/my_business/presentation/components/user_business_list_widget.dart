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
    final businessListProvider =
        ref.watch(myBusinessListScreenControllerProvider);

    return RefreshIndicator(
      color: Colors.orange,
      onRefresh: () async {
        await myBusinessListController.fetchUserBusinessList();
      },
      child: FutureBuilder<List<Business?>>(
        future: businessListProvider.when(
          data: (data) => Future.value(data),
          loading: () => myBusinessListController.getUserBusinessList(),
          error: (error, stackTrace) => Future.error(error),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final business = snapshot.data![index];
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(business?.name ?? ''),
                        onTap: () => myBusinessListController.onTapBusiness(
                          business: business!,
                          context: context,
                        ),
                        subtitle: Text(
                            "${business?.email ?? ''} - ${business?.phoneNumber ?? ''}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => {
                            myBusinessListController.deleteBusiness(
                              businessId: business?.id ?? '',
                            ),
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: Colors.orange,
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
