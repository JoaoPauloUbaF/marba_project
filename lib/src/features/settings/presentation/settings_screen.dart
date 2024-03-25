import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';

import '../application/settings_screen_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key, this.shouldRenderAppBar = true});
  final bool shouldRenderAppBar;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(settingsScreenControllerProvider.notifier);

    return Scaffold(
      appBar: shouldRenderAppBar
          ? AppBar(
              title: const Text('Settings'),
            )
          : null,
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notification Settings'),
            onTap: () {},
            leading: const Icon(Icons.notifications),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account Settings'),
            onTap: () {
              Navigator.pushNamed(context, viewController.onAccountTaped());
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
