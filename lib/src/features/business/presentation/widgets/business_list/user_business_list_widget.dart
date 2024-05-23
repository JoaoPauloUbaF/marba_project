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
          return GridView.builder(
            itemCount: businessList.length,
            itemBuilder: (context, index) {
              final business = businessList[index];
              return Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(business?.imageUrl ?? ''),
                    ),
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
                        color: Theme.of(context).colorScheme.error,
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
                ),
              );
            },
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                mainAxisExtent:
                    MediaQuery.of(context).size.width > 600 ? 120 : 100),
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
