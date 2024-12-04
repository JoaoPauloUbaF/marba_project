import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/core/models/business/business.dart';

class BusinessTileWidget extends ConsumerWidget {
  const BusinessTileWidget({
    super.key,
    required this.businessId,
  });

  final String businessId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessProfileViewModel =
        ref.read(businessProfileViewModelProvider.notifier);
    return FutureBuilder(
      future: ref
          .read(businessProfileDataProvider)
          .getBusinessProfileData(uid: businessId),
      builder: (BuildContext context, AsyncSnapshot<BusinessModel?> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final business = snapshot.data;
          if (business == null) return const SizedBox.shrink();
          return InkWell(
            onTap: () {
              if (snapshot.data == null) return;
              businessProfileViewModel.onBusinessDetailsTap(context, business);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        business.profileImageUrl ??
                            'https://via.placeholder.com/150',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          business.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 12,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              '${business.address.city}, ${business.address.state}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 12,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                            Text(
                              business.phoneNumber,
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
