import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/authentication_data_provider.dart';
import 'package:project_marba/src/features/authentication/data/authentication_repository.dart';
import 'package:project_marba/src/features/darkmode/presentation/theme_switch.dart';
import 'package:riverpod/riverpod.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitch(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ProfileForm(),
      ),
    );
  }
}

class ProfileForm extends ConsumerWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authRepositoryProvider);
    final formKey = GlobalKey<FormState>();
    final displayNameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final addressController = TextEditingController();

    void submitForm() async {
      if (formKey.currentState?.validate() ?? false) {
        try {
          // Submit the form and create the user profile in Firestore
          await authProvider.createProfileInFirestore(
            uid: authProvider.getCurrentUser()!.uid,
            displayName: displayNameController.text,
            phoneNumber: phoneNumberController.text,
            address: addressController.text,
          );

          // Navigation to home screen upon successful form submission
          Navigator.pushReplacementNamed(context, '/home');
        } catch (e) {
          // Handle error, e.g., display an error message
          print('Error submitting form: $e');
        }
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: displayNameController,
            decoration: const InputDecoration(labelText: 'Display Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your display name';
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
            controller: addressController,
            decoration: const InputDecoration(labelText: 'Address'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
