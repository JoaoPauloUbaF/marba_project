import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_field_controller.g.dart';

@Riverpod(keepAlive: true)
class ImageFieldController extends _$ImageFieldController {
  @override
  File? build() {
    return null;
  }

  Future<void> pickNewOfferImage(ImageSource source) async {
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
}
