import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/features/authentication/data/authentication_repository.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project_marba/src/features/user_profile/presentation/components/male_user_avatar_widget.dart';

import '../../application/profile_forms_controller/profile_forms_screen_controller.dart';

//TODO: refactor, cidade e estado, avatar, uso de componentes unificados, usar essa tela caso o user nao tenha finalizado o cadastro
class ProfileFormScreen extends ConsumerWidget {
  const ProfileFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authRepositoryProvider);
    final profileFormsViewModel =
        ref.read(profileFormsScreenControllerProvider.notifier);

    final formKey = GlobalKey<FormState>();
    final displayNameController = TextEditingController();
    final phoneNumberController = MaskedTextController(mask: '(00) 00000-0000');
    final addressStreetController = TextEditingController();
    final addressNumberController = MaskedTextController(mask: '00000');
    final addressNeighborhoodController = TextEditingController();
    final addressCityController = TextEditingController();
    final addressComplementController = TextEditingController();
    final addressStateController = TextEditingController();
    final addressZipCodeController =
        MaskedTextController(mask: '00000-000'); // Máscara para CEP

    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProfileForm(
            formKey: formKey,
            displayNameController: displayNameController,
            phoneNumberController: phoneNumberController,
            addressZipCodeController: addressZipCodeController,
            addressStreetController: addressStreetController,
            addressNumberController: addressNumberController,
            addressNeighborhoodController: addressNeighborhoodController,
            addressCityController: addressCityController,
            addressStateController: addressStateController,
            profileController: profileFormsViewModel,
            authProvider: authProvider,
            addressComplementController: addressComplementController,
          ),
        ),
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.formKey,
    required this.displayNameController,
    required this.phoneNumberController,
    required this.addressZipCodeController,
    required this.addressStreetController,
    required this.addressNumberController,
    required this.addressNeighborhoodController,
    required this.addressCityController,
    required this.addressStateController,
    required this.profileController,
    required this.authProvider,
    required this.addressComplementController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController displayNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressZipCodeController;
  final TextEditingController addressStreetController;
  final TextEditingController addressNumberController;
  final TextEditingController addressNeighborhoodController;
  final TextEditingController addressComplementController;
  final TextEditingController addressCityController;
  final TextEditingController addressStateController;
  final ProfileFormsScreenController profileController;
  final AuthenticationRepository authProvider;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        );
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserAvatarWidget(
                type: 'men',
              ),
              SizedBox(width: 16.0),
              UserAvatarWidget(
                type: 'woman',
              ),
            ],
          ),
          TextFormField(
            controller: displayNameController,
            decoration: InputDecoration(
              labelText: 'Nome',
              labelStyle: labelStyle,
            ),
            validator: (value) => profileController.validateName(value),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: phoneNumberController,
            onTap: () => {phoneNumberController.selection},
            onTapOutside: (event) => {
              FocusScope.of(context).unfocus(),
            },
            decoration: InputDecoration(
              labelText: 'Telefone',
              hintText: '(00) 00000-0000',
              labelStyle: labelStyle,
            ),
            validator: (value) => profileController.validatePhoneNumber(value),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: addressZipCodeController,
            decoration: InputDecoration(
                labelText: 'CEP',
                hintText: '00000-000',
                labelStyle: labelStyle),
            validator: (value) => profileController.validateZipCode(value),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: TextFormField(
                  controller: addressStreetController,
                  decoration: InputDecoration(
                      labelText: 'Endereço', labelStyle: labelStyle),
                  validator: (value) =>
                      profileController.validateAddressStreet(value),
                ),
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: TextFormField(
                  controller: addressNumberController,
                  decoration: InputDecoration(
                      labelText: 'Número', labelStyle: labelStyle),
                  validator: (value) =>
                      profileController.validateAddressNumber(value),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: TextFormField(
                  controller: addressNeighborhoodController,
                  decoration: InputDecoration(
                      labelText: 'Bairro', labelStyle: labelStyle),
                  validator: (value) =>
                      profileController.validateNeighborhood(value),
                ),
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: TextFormField(
                  controller: addressComplementController,
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                    labelStyle: labelStyle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Flexible(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    value: addressCityController.text.isEmpty
                        ? null
                        : addressCityController.text,
                    decoration: InputDecoration(
                        labelText: 'Cidade', labelStyle: labelStyle),
                    items: RegistrationUtils().getCitiesList(),
                    onChanged: (String? newValue) {
                      addressCityController.text = newValue ?? '';
                    },
                    validator: (value) => profileController.validateCity(value),
                  )),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: DropdownButtonFormField<String>(
                  value: addressStateController.text.isEmpty
                      ? null
                      : addressStateController.text,
                  decoration: InputDecoration(
                      labelText: 'Estado', labelStyle: labelStyle),
                  items: RegistrationUtils().getStatesList(),
                  onChanged: (String? newValue) {
                    addressStateController.text = newValue ?? '';
                  },
                  validator: (value) => profileController.validateState(value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () async {
              await profileController.validateAndSubmitForm(
                formKey: formKey,
                uid: authProvider.getCurrentUser()!.uid,
                displayName: displayNameController.text,
                phoneNumber: phoneNumberController.text,
                street: addressStreetController.text,
                number: addressNumberController.text,
                neighborhood: addressNeighborhoodController.text,
                city: addressCityController.text,
                state: addressStateController.text,
                zipCode: addressZipCodeController.text,
                context: context,
              );
            },
            child: profileController.getSubmitButtonWidget(),
          ),
        ],
      ),
    );
  }
}
