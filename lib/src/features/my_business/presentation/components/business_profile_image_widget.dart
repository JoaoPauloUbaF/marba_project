import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

import 'loading_widget.dart';

class BusinessProfileImageWidget extends ConsumerWidget {
  const BusinessProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(businessProfileScreenControllerProvider);
    final imageUploadingStatus = ref.watch(imageUploadingStatusProvider);

    return imageUploadingStatus
        ? const LoadingWidget()
        : InkWell(
            onTap: () => ref
                .read(businessProfileScreenControllerProvider.notifier)
                .updateBusinessProfileImage(),
            child: ref
                .read(businessProfileScreenControllerProvider.notifier)
                .getBusinessProfileImage(context),
          );
  }
}
