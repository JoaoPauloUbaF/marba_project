import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/application/profile_screen_controller/profile_screen_controller.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';

import '../../../darkmode/presentation/components/theme_switch.dart';

class AppProfileScreen extends ConsumerWidget {
  const AppProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileScreen(
      showDeleteConfirmationDialog: true,
      appBar: AppBar(
        actions: const [
          ThemeSwitch(),
        ],
      ),
      actions: [
        SignedOutAction((context) {
          Navigator.pop(context, '/sign-in');
        }),
        // AuthStateChangeAction<SignedIn>((context, state) { }) to-do
      ],
      children: [
        FutureBuilder<String?>(
          future: ref
              .read(profileScreenControllerProvider.notifier)
              .getUserAddress(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Address: ${snapshot.data}');
            }
          },
        ),
      ],
    );
  }
}
