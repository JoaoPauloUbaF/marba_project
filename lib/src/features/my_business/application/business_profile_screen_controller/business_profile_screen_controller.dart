import 'dart:developer';
import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/my_business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_profile_screen_controller.g.dart';

@Riverpod(keepAlive: true)
class BusinessProfileScreenController
    extends _$BusinessProfileScreenController {
  @override
  Business? build() {
    return null;
  }

  void setSelectedBusiness(Business business) {
    state = business;
    fetchBusinessProfile();
  }

  String getBusinessName() {
    return state?.name ?? '';
  }

  Future<void> fetchBusinessProfile() async {
    ref.invalidate(feedOffersTypeFilterProvider);
    final business = await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: state!.id);
    if (business != null) {
      state = business;
    }
  }

  Color getBusinessStatusColor() {
    switch (state?.status) {
      case BusinessStatus.open:
        return Colors.green;
      case BusinessStatus.closed:
        return Colors.red;
      case BusinessStatus.pending:
        return Colors.orange;
      case BusinessStatus.rejected:
        return Colors.red;
      case BusinessStatus.suspended:
        return Colors.amber;
      case BusinessStatus.deleted:
        return Colors.black;
      default:
        return Colors.black;
    }
  }

  Future<void> updateBusinessProfileImage() async {
    final image = await pickNewBusinessProfileImage();
    if (image == null) {
      return;
    }
    ref.read(imageUploadingStatusProvider.notifier).state = true;
    await ref
        .read(businessProfileDataProvider)
        .updateBusinessProfileImage(
          uid: state?.id ?? '',
          imageFile: image,
        )
        .then((_) => {
              fetchBusinessProfile().then((value) => ref
                  .read(imageUploadingStatusProvider.notifier)
                  .state = false),
            });
  }

  Future<File?> pickNewBusinessProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
    return null;
  }

  Future<Widget> getBusinessProfileImage(
      {required double width, required double height}) async {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: width * 3 / 4,
          child: state?.imageUrl != null
              ? Image(
                  width: width,
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const UserAvatar(
                      size: 200,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    state?.imageUrl ?? '',
                  ),
                )
              : SizedBox(
                  width: width,
                  child: const Icon(Icons.add_a_photo_sharp, size: 100),
                ),
        ),
        if (await isBusinessOwner())
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () => updateBusinessProfileImage(),
              child: const Stack(children: [
                Icon(
                  Icons.add_a_photo,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                    )
                  ],
                ),
              ]),
            ),
          ),
      ],
    );
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage, // Permissão para acessar a galeria
    ].request();

    if (statuses[Permission.camera]!.isDenied) {
      // A permissão da câmera foi negada
    }

    if (statuses[Permission.storage]!.isDenied) {
      // A permissão para acessar a galeria foi negada
    }
  }

  Future<bool> isBusinessOwner() async {
    final userId = ref.read(authRepositoryProvider).getCurrentUser()?.uid;
    if (userId == null) {
      return false;
    }
    final userBusinessIds = await ref
        .read(userProfileDataProvider)
        .getOwnedBusinessIds(uid: userId);
    return userBusinessIds.contains(state?.id);
  }

  void dispose() {
    state = null;
  }
}

final imageUploadingStatusProvider = StateProvider<bool>((ref) => false);
