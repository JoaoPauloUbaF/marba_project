import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/my_business/presentation/components/loading_widget.dart';

class BusinessProfileImageWidget extends ConsumerWidget {
  const BusinessProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(businessProfileScreenControllerProvider);
    final imageUploadingStatus = ref.watch(imageUploadingStatusProvider);
    final businessController =
        ref.read(businessProfileScreenControllerProvider.notifier);

    return imageUploadingStatus
        ? const LoadingWidget()
        : FutureBuilder(
            future: businessController.getBusinessProfileImage(context),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    snapshot.data!,
                  ],
                );
              } else {
                return const LoadingWidget();
              }
            },
          );
  }
}
