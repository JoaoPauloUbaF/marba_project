import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/authentication_repository.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch.dart';
import 'package:project_marba/src/features/user_profile/application/profile_forms_screen_controller.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

class ProfileFormScreen extends ConsumerWidget {
  const ProfileFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authRepositoryProvider);
    final state = ref.read(profileFormsScreenControllerProvider);
    final profileController =
        ref.read(profileFormsScreenControllerProvider.notifier);

    final formKey = GlobalKey<FormState>();
    final displayNameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final addressStreetController = TextEditingController();
    final addressNumberController = TextEditingController();
    final addressNeighborhoodController = TextEditingController();
    final addressCityController = TextEditingController();
    final addressStateController = TextEditingController();
    final addressZipCodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitch(),
        ],
      ),
      body: Padding(
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
            profileController: profileController,
            authProvider: authProvider),
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
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController displayNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressZipCodeController;
  final TextEditingController addressStreetController;
  final TextEditingController addressNumberController;
  final TextEditingController addressNeighborhoodController;
  final TextEditingController addressCityController;
  final TextEditingController addressStateController;
  final ProfileFormsScreenController profileController;
  final AuthenticationRepository authProvider;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const UserAvatar(),
          TextFormField(
            controller: displayNameController,
            decoration: const InputDecoration(labelText: 'Complete Name'),
            validator: (value) => profileController.validateName(value),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: phoneNumberController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            validator: (value) => profileController.validatePhoneNumber(value),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: addressZipCodeController,
            decoration: const InputDecoration(labelText: 'Zip code'),
            validator: (value) => profileController.validateZipCode(value),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Flexible(
                flex: 4,
                child: TextFormField(
                  controller: addressStreetController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) =>
                      profileController.validateAddressStreet(value),
                ),
              ),
              const SizedBox(width: 16.0),
              Flexible(
                child: TextFormField(
                  controller: addressNumberController,
                  decoration: const InputDecoration(labelText: 'Number'),
                  validator: (value) =>
                      profileController.validateAddressNumber(value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: addressNeighborhoodController,
            decoration: const InputDecoration(labelText: 'Neighborhood'),
            validator: (value) => profileController.validateNeighborhood(value),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Flexible(
                flex: 4,
                child: TextFormField(
                  controller: addressCityController,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) => profileController.validateCity(value),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: TextFormField(
                  controller: addressStateController,
                  decoration: const InputDecoration(labelText: 'State'),
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
