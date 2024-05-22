import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_field_controller.g.dart';

@Riverpod(keepAlive: true)
class ImageFieldController extends _$ImageFieldController {
  @override
  File? build() {
    return null;
  }

  Future<void> pickImage(ImageSource source) async {
    await requestPermissions();
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      state = File(pickedFile.path);
    }
  }

  String? validateImageUrl(String? value) {
    if (value == null) {
      return 'Por favor, selecione uma imagem';
    }
    return null;
  }

  Future<void> requestPermissions() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus storageStatus = await Permission.storage.status;

    if (cameraStatus.isDenied || storageStatus.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();

      cameraStatus = statuses[Permission.camera]!;
      storageStatus = statuses[Permission.storage]!;
    }
  }
}
