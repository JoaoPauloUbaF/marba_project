import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

class BusinessProfileImageWidget extends ConsumerWidget {
  const BusinessProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(businessProfileScreenControllerProvider);
    final imageUploadingStatus = ref.watch(imageUploadingStatusProvider);

    return imageUploadingStatus
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Padding(
              padding: EdgeInsets.all(50.0),
              child: CircularProgressIndicator(),
            ),
          )
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
