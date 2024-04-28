import 'package:flutter/material.dart';
import 'package:project_marba/src/features/image_picker/presentation/widgets/image_field_widget.dart';
import 'package:project_marba/src/features/business/application/business_creation_controller/business_creation_controller.dart';

class BusinessInfoFormWidget extends StatelessWidget {
  const BusinessInfoFormWidget({
    super.key,
    required this.formKeys,
    required this.nameController,
    required this.businessCreationController,
    required this.emailController,
    required this.phoneController,
    required this.onChanged,
  });

  final List<GlobalKey<FormState>> formKeys;
  final TextEditingController nameController;
  final BusinessCreationController businessCreationController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKeys[0],
      child: Column(
        children: [
          const ImageFieldWidget(),
          TextFormField(
            key: const ValueKey('name'),
            controller: nameController,
            decoration:
                const InputDecoration(labelText: 'Nome do Empreendimento'),
            validator: (value) =>
                businessCreationController.validateName(value),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'E-mail'),
            validator: (value) =>
                businessCreationController.validateEmail(value),
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Telefone'),
            validator: (value) =>
                businessCreationController.validatePhoneNumber(value),
          ),
        ],
      ),
    );
  }
}
