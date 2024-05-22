import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';

class BusinessProfileImageWidget extends ConsumerWidget {
  final bool isCreatingBusiness;

  const BusinessProfileImageWidget(
      {super.key, this.isCreatingBusiness = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(businessProfileViewModelProvider);
    final imageUploadingStatus = ref.watch(imageUploadingStatusProvider);
    final businessController =
        ref.read(businessProfileViewModelProvider.notifier);
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    final width = isWideScreen
        ? MediaQuery.of(context).size.width * 0.25
        : MediaQuery.of(context).size.width;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: imageUploadingStatus
          ? const LoadingWidget()
          : FutureBuilder(
              future: businessController.getBusinessProfileImage(
                width: width,
              ),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return snapshot.data!;
                } else {
                  return const LoadingWidget();
                }
              },
            ),
    );
  }
}
