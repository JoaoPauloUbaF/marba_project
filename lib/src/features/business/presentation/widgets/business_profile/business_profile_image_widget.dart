import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';

import '../../../../../core/utils/view_utils.dart';

class BusinessProfileImageWidget extends ConsumerWidget {
  final bool isCreatingBusiness;
  final double size;

  const BusinessProfileImageWidget(
      {super.key, this.isCreatingBusiness = false, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(businessProfileViewModelProvider);
    final imageUploadingStatus = ref.watch(imageUploadingStatusProvider);
    final viewModel = ref.read(businessProfileViewModelProvider.notifier);
    final businessProfile = ref.watch(businessProfileViewModelProvider);
    final relativeSize = isWideScreen(context) ? size * 2 : size;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: relativeSize,
      height: relativeSize,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        shape: BoxShape.circle,
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: imageUploadingStatus
            ? const LoadingWidget()
            : businessProfile?.profileImageUrl != null
                ? InkWell(
                    onTap: () => viewModel.updateBusinessProfileImage(),
                    child: Image(
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        businessProfile?.profileImageUrl ?? '',
                      ),
                    ),
                  )
                : Icon(
                    Icons.add_a_photo,
                    size: size / 2,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
      ),
    );
  }
}
