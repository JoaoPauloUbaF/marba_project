import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../application/image_field_controller.dart';

class ImageFieldWidget extends ConsumerWidget {
  final String? imageURL;
  final File? imageFile;
  final Function(File?) onImagePicked;

  const ImageFieldWidget({
    super.key,
    this.imageURL,
    required this.onImagePicked,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    File? image;
    final imageFieldController =
        ref.read(imageFieldControllerProvider.notifier);

    return FormField(
      validator: (value) => imageFieldController.validateImageUrl(
        image?.path ?? imageFile?.path,
      ),
      builder: (FormFieldState<dynamic> field) {
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
                            Text('Câmera'),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          imageFieldController
                              .pickImage(ImageSource.camera)
                              .then(
                            (value) {
                              image = value;
                              field.didChange(image);
                              onImagePicked(image);
                            },
                          );
                        },
                      ),
                      ListTile(
                        title: const Row(
                          children: [
                            Icon(Icons.image),
                            SizedBox(width: 8),
                            Text('Galeria'),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          imageFieldController
                              .pickImage(ImageSource.gallery)
                              .then(
                            (value) {
                              image = value;
                              field.didChange(image);
                              onImagePicked(image);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Builder(builder: (context) {
                  if (imageURL != null) {
                    return Image.network(
                      imageURL!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          const Placeholder(),
                    );
                  } else if (image != null) {
                    return Image.file(
                      image!,
                      fit: BoxFit.fill,
                    );
                  } else if (imageFile != null) {
                    return Image.file(
                      imageFile!,
                      fit: BoxFit.fill,
                    );
                  } else {
                    return Icon(
                      Icons.add_a_photo_sharp,
                      size: 100,
                      color: Theme.of(context).colorScheme.secondary,
                    );
                  }
                }),
              ),
            ),
            field.errorText != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      field.errorText.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
