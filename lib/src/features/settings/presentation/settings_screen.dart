import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/settings_screen_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(settingsScreenControllerProvider.notifier);

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notificações'),
            onTap: () {},
            leading: const Icon(Icons.notifications),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Conta'),
            onTap: () {
              Navigator.pushNamed(context, viewController.onAccountTaped());
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacidade'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.business_center),
            title: const Text('Quero criar um Negócio'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
