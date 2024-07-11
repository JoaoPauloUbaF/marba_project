import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/authentication/data/authentication_repository.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:project_marba/src/features/user_profile/presentation/widgets/user_avatar_widget.dart';

import '../../application/profile_forms_controller/profile_forms_screen_controller.dart';

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

    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isWideScreen(context)
            ? Center(
                child: Card(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  child: Container(
                    width: isWideScreen(context) ? 500 : double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    child: ProfileForm(
                      formKey: formKey,
                      displayNameController: displayNameController,
                      phoneNumberController: phoneNumberController,
                      profileController: profileFormsViewModel,
                      authProvider: authProvider,
                    ),
                  ),
                ),
              )
            : ProfileForm(
                formKey: formKey,
                displayNameController: displayNameController,
                phoneNumberController: phoneNumberController,
                profileController: profileFormsViewModel,
                authProvider: authProvider,
              ),
      ),
    );
  }
}

class ProfileForm extends ConsumerWidget {
  const ProfileForm({
    super.key,
    required this.formKey,
    required this.displayNameController,
    required this.phoneNumberController,
    required this.profileController,
    required this.authProvider,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController displayNameController;
  final TextEditingController phoneNumberController;

  final ProfileFormsScreenController profileController;
  final AuthenticationRepository authProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labelStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        );
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const UserAvatarWidget(),
          const Gap(40.0),
          SizedBox(
            width: isWideScreen(context) ? 400 : double.infinity,
            child: TextFormField(
              controller: displayNameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: labelStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              validator: (value) => profileController.validateName(value),
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: isWideScreen(context) ? 400 : double.infinity,
            child: TextFormField(
              controller: phoneNumberController,
              onTap: () => {phoneNumberController.selection},
              onTapOutside: (event) => {
                FocusScope.of(context).unfocus(),
              },
              decoration: InputDecoration(
                labelText: 'Telefone',
                hintText: '(00) 00000-0000',
                labelStyle: labelStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              validator: (value) =>
                  profileController.validatePhoneNumber(value),
              keyboardType: TextInputType.phone,
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () async {
              if (authProvider.getCurrentUser() == null) return;
              await profileController.validateAndSubmitForm(
                formKey: formKey,
                uid: authProvider.getCurrentUser()!.uid,
                displayName: displayNameController.text,
                phoneNumber: phoneNumberController.text,
                context: context,
              );
            },
            child: const Text('Salvar perfil'),
          ),
        ],
      ),
    );
  }
}
