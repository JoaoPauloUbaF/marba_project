import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class BusinessProfileImageWidget extends StatefulWidget {
  const BusinessProfileImageWidget({Key? key}) : super(key: key);

  @override
  _BusinessProfileImageWidgetState createState() =>
      _BusinessProfileImageWidgetState();
}

class _BusinessProfileImageWidgetState
    extends State<BusinessProfileImageWidget> {
  File? _imageFile;

  Future<void> _getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this._imageFile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => requestPermissions().then((_) => _getImage()),
      child: Image(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        fit: BoxFit.fill,
        image: _imageFile != null
            ? FileImage(_imageFile!)
            : const NetworkImage(
                    'https://scontent.fjdf6-1.fna.fbcdn.net/v/t39.30808-6/305526771_589615162866249_4361465910529182138_n.png?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=JttfJl4LrgwAX8RS_pf&_nc_ht=scontent.fjdf6-1.fna&oh=00_AfC2yqeXTz4zjfXxM55-D4fKh4EwyCWmBUNklqpnJgLA1w&oe=65E400ED')
                as ImageProvider<Object>,
      ),
    );
  }
}
