import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_marba/src/features/my_business/data/business_profile_data/business_profile_provider.dart';
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
      print('Failed to pick image: $e');
    }
    return null;
  }

  Widget getBusinessProfileImage(BuildContext context) {
    if (state?.imageUrl != null) {
      return Image(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
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
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return const UserAvatar(
            size: 200,
          );
        },
        fit: BoxFit.fill,
        image: NetworkImage(
          state?.imageUrl ?? '',
        ),
      );
    }
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: const UserAvatar(
          size: 200,
        ));
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
}

final imageUploadingStatusProvider = StateProvider<bool>((ref) => false);
