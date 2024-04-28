import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/my_business_list_screen_controller/my_business_list_screen_controller.dart';

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
      onRefresh: () async {
        await myBusinessListController.fetchUserBusinessList();
      },
      child: businessListProvider.when(
        data: (businessList) {
          return ListView.separated(
            itemCount: businessList.length,
            itemBuilder: (context, index) {
              final business = businessList[index];
              return Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                child: ListTile(
                  title: Text(business?.name ?? ''),
                  onTap: () => myBusinessListController.onTapBusiness(
                    business: business!,
                    context: context,
                  ),
                  subtitle: Text(
                      "${business?.email ?? ''} - ${business?.phoneNumber ?? ''}"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () => {
                      myBusinessListController
                          .showDeleteBusinessConfirmationDialog(
                        context,
                        businessId: business?.id ?? '',
                      ),
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
