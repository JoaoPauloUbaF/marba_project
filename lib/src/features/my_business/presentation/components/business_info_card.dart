import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_category_tiles.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_status_widget.dart';

class BusinessContactInfoCard extends ConsumerWidget {
  const BusinessContactInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref
        .watch(businessProfileScreenControllerProvider); // to-do use notifier
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  business?.name ?? '',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 16),
                const BusinessStatusWidget(),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  business?.phoneNumber ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Spacer(),
                Text(
                  business?.email ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            BusinessCategoryTiles(),
          ],
        ),
      ),
    ));
  }
}
