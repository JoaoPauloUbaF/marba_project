import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';

class OfferImageField extends StatefulWidget {
  final OfferCreationController offerCreationController;

  final String? imageURL;

  const OfferImageField({
    Key? key,
    required this.offerCreationController,
    this.imageURL,
  }) : super(key: key);

  @override
  State<OfferImageField> createState() => _OfferImageFieldState();
}

class _OfferImageFieldState extends State<OfferImageField> {
  File? offerImage;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) => widget.offerCreationController.validateImageUrl(
        offerImage?.path,
      ),
      builder: (FormFieldState<dynamic> field) {
        return Column(
          children: [
            InkWell(
              onTap: () =>
                  widget.offerCreationController.pickNewOfferImage().then(
                (value) {
                  offerImage = value;
                },
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: offerImage != null
                    ? Image.file(
                        offerImage!,
                        fit: BoxFit.fill,
                      )
                    : widget.imageURL != null
                        ? Image.network(
                            widget.imageURL!,
                            fit: BoxFit.fill,
                          )
                        : const Icon(
                            Icons.add_a_photo_sharp,
                            size: 100,
                          ),
              ),
            ),
            field.errorText != null
                ? Text(
                    field.errorText.toString(),
                    style: TextStyle(color: ThemeData().colorScheme.error),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}