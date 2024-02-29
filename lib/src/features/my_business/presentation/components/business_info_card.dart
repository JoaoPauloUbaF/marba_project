import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_category_tiles.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_status_widget.dart';
import 'package:project_marba/src/shared/models/business/business.dart';

class BusinessContactInfoCard extends ConsumerWidget {
  const BusinessContactInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref
        .watch(businessProfileScreenControllerProvider); // to-do use notifier
    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BusinessNameAndStatus(business: business),
            const SizedBox(height: 4),
            BusinessPhoneAndEmail(business: business),
            const SizedBox(height: 16),
            BusinessCategoryTiles(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class BusinessPhoneAndEmail extends StatelessWidget {
  const BusinessPhoneAndEmail({
    super.key,
    required this.business,
  });

  final Business? business;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              business?.phoneNumber ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.email,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              business?.email ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class BusinessNameAndStatus extends StatelessWidget {
  const BusinessNameAndStatus({
    super.key,
    required this.business,
  });

  final Business? business;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          business?.name ?? '',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(width: 8),
        const BusinessStatusWidget(),
      ],
    );
  }
}
