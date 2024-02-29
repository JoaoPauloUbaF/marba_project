import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

class BusinessProfileImageWidget extends ConsumerWidget {
  const BusinessProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(businessProfileScreenControllerProvider);
    return InkWell(
      onTap: () => ref
          .read(businessProfileScreenControllerProvider.notifier)
          .updateBusinessProfileImage(),
      child: ref
          .read(businessProfileScreenControllerProvider.notifier)
          .getBusinessProfileImage(context),
    );
  }
}
