import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/image_picker/presentation/widgets/image_field_widget.dart';
import 'package:project_marba/src/features/business/application/business_creation_view_model/business_creation_view_model.dart';

class BusinessInfoFormWidget extends StatefulWidget {
  const BusinessInfoFormWidget({
    super.key,
    required this.formKeys,
    required this.nameController,
    required this.businessCreationController,
    required this.emailController,
    required this.phoneController,
    required this.onImagePicked,
  });

  final List<GlobalKey<FormState>> formKeys;
  final TextEditingController nameController;
  final BusinessCreationViewModel businessCreationController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final void Function(File?) onImagePicked;

  @override
  State<BusinessInfoFormWidget> createState() => _BusinessInfoFormWidgetState();
}

class _BusinessInfoFormWidgetState extends State<BusinessInfoFormWidget> {
  File? businessProfileImage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeys[0],
      child: Column(
        children: [
          ImageFieldWidget(
            onImagePicked: (image) {
              widget.onImagePicked(image);
              businessProfileImage = image;
            },
            imageFile: businessProfileImage,
          ),
          const Gap(16),
          TextFormField(
            key: const ValueKey('name'),
            controller: widget.nameController,
            decoration: const InputDecoration(
              labelText: 'Nome do Empreendimento',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.business),
            ),
            validator: (value) =>
                widget.businessCreationController.validateName(value),
          ),
          const Gap(16),
          TextFormField(
            controller: widget.emailController,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) =>
                widget.businessCreationController.validateEmail(value),
          ),
          const Gap(16),
          TextFormField(
            controller: widget.phoneController,
            decoration: const InputDecoration(
              labelText: 'Telefone',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
            validator: (value) =>
                widget.businessCreationController.validatePhoneNumber(value),
          ),
        ],
      ),
    );
  }
}
