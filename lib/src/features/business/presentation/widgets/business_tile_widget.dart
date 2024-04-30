import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/core/models/business/business.dart';

import '../screens/business_profile_screen.dart';

class BusinessTileWidget extends ConsumerWidget {
  const BusinessTileWidget({
    super.key,
    required this.businessId,
  });

  final String businessId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref
          .read(businessProfileDataProvider)
          .getBusinessProfileData(uid: businessId),
      builder: (BuildContext context, AsyncSnapshot<BusinessModel?> snapshot) {
        if (snapshot.hasData) {
          return InkWell(
            onTap: () {
              ref
                  .read(businessProfileViewModelProvider.notifier)
                  .setSelectedBusiness(snapshot.data!);
              showModalBottomSheet(
                scrollControlDisabledMaxHeightRatio: .9,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Scaffold(
                        body: const BusinessProfileScreen(),
                        appBar: AppBar(
                          title: Text(snapshot.data?.name ?? ''),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(snapshot.data!.imageUrl!),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 12,
                            ),
                            Text(
                              '${snapshot.data!.address.city}, ${snapshot.data!.address.state}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 12,
                            ),
                            Text(
                              snapshot.data!.phoneNumber,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
