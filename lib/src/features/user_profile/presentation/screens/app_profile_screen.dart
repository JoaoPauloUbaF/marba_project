import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/user_profile/application/profile_screen_controller/profile_screen_controller.dart';
import 'package:project_marba/src/core/models/address/address.dart';

import '../../../darkmode/presentation/components/theme_switch_widget.dart';
import '../../../location_management/presentation/widgets/address_display_widget.dart';

class AppProfileScreen extends ConsumerWidget {
  const AppProfileScreen({super.key}); //TODO: Create my own profile screen

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileScreen(
      showDeleteConfirmationDialog: true,
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
        ],
      ),
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, '/sign-in');
        }),
        // AuthStateChangeAction<SignedIn>((context, state) { }) to-do
      ],
      children: [
        FutureBuilder<Address?>(
          future: ref
              .read(profileScreenControllerProvider.notifier)
              .getUserAddress(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Text(
                  'Parece que houve um erro, tente novamente mais tarde.');
            } else {
              return AddressDisplayWidget(
                  address: snapshot.data!,
                  isBusinessAddress: false,
                  isEditable: true);
            }
          },
        ),
      ],
    );
  }
}
