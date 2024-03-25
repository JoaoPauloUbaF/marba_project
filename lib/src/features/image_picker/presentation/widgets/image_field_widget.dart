import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../application/image_field_controller.dart';

class ImageFieldWidget extends ConsumerWidget {
  final String? imageURL;

  const ImageFieldWidget({
    super.key,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageFieldControllerProvider);
    ref.invalidate(imageFieldControllerProvider);
    final imageFieldController =
        ref.read(imageFieldControllerProvider.notifier);

    return FormField(
      validator: (value) => imageFieldController.validateImageUrl(
        image?.path,
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
                              .pickNewOfferImage(ImageSource.camera);
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
                              .pickNewOfferImage(ImageSource.gallery);
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
                    child: imageURL != null
                        ? Image.network(
                            imageURL!,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                const Placeholder(),
                          )
                        : image != null
                            ? Image.file(
                                image,
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.add_a_photo_sharp,
                                size: 100,
                              ),
                  )),
            ),
            field.errorText != null
                ? Text(
                    field.errorText.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
