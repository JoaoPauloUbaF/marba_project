import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/theme_switch.dart';
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
    final addressController = TextEditingController();
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const UserAvatar(),
              TextFormField(
                controller: displayNameController,
                decoration: const InputDecoration(labelText: 'Complete Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addressZipCodeController,
                decoration: const InputDecoration(labelText: 'Zip code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address zip code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(labelText: 'Address'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address street';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      controller: addressNumberController,
                      decoration: const InputDecoration(labelText: 'Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addressNeighborhoodController,
                decoration: const InputDecoration(labelText: 'Neighborhood'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address neighborhood';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: TextFormField(
                      controller: addressCityController,
                      decoration: const InputDecoration(labelText: 'City'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address city';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: addressStateController,
                      decoration: const InputDecoration(labelText: 'State'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address state';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    try {
                      Address address = Address(
                        street: addressController.text,
                        number: addressNumberController.text,
                        neighborhood: addressNeighborhoodController.text,
                        city: addressCityController.text,
                        state: addressStateController.text,
                        zipCode: addressZipCodeController.text,
                      );

                      await profileController
                          .createProfile(
                            uid: authProvider.getCurrentUser()?.uid ?? '',
                            displayName: displayNameController.text,
                            phoneNumber: phoneNumberController.text,
                            address: address,
                          )
                          .then(
                            (value) => profileController.onSubmit(context),
                          );
                    } catch (e) {
                      print('Error submitting form: $e');
                    }
                  }
                },
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Create Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
