import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BusinessProfileImageField extends StatefulWidget {
  final Function(File?) onImageSelected;
  final String? imageURL;

  const BusinessProfileImageField({
    super.key,
    required this.onImageSelected,
    this.imageURL,
  });

  @override
  State<BusinessProfileImageField> createState() =>
      _BusinessProfileImageFieldState();
}

class _BusinessProfileImageFieldState extends State<BusinessProfileImageField> {
  late File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 8),
                        Text('Camera'),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 8),
                        Text('Gallery'),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            child: Container(
              child: widget.imageURL != null
                  ? Image.network(
                      widget.imageURL!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          const Placeholder(),
                    )
                  : profileImage != null
                      ? Image.file(
                          profileImage!,
                          fit: BoxFit.fill,
                        )
                      : const Icon(
                          Icons.add_a_photo_sharp,
                          size: 100,
                        ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 50);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        profileImage = imageFile;
      });
      widget.onImageSelected(imageFile);
    }
  }
}
