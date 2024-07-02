import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/settings_screen_controller.dart';

class ProfileSettingsView extends ConsumerWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(settingsScreenControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, color: colorScheme.tertiary),
            title: const Text('Conta'),
            onTap: () {
              Navigator.pushNamed(context, viewController.onAccountTaped());
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_sharp, color: colorScheme.tertiary),
            title: const Text('Conversas'),
            onTap: () {
              Navigator.pushNamed(context, viewController.onChatTaped());
            },
          ),
          ListTile(
            title: const Text('Notificações'),
            onTap: () {
              Navigator.pushNamed(
                  context, viewController.onNotificationTaped());
            },
            leading: Icon(Icons.notifications, color: colorScheme.tertiary),
          ),
          ListTile(
            title: const Text('Endereços'),
            onTap: () {
              Navigator.pushNamed(context, viewController.onAddressTaped());
            },
            leading: Icon(Icons.location_on, color: colorScheme.tertiary),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: colorScheme.tertiary),
            title: const Text('Privacidade'),
            onTap: () {
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          ListTile(
            leading: Icon(Icons.business_center, color: colorScheme.tertiary),
            title: const Text('Quero criar um Negócio'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info, color: colorScheme.tertiary),
            title: const Text('Sobre'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  'assets/images/logo.png',
                  width: 70,
                  height: 70,
                ),
                applicationName: 'Onktem',
                applicationVersion: '1.0.0-beta',
                applicationLegalese: '© 2024 Project Marba',
              );
            },
          ),
        ],
      ),
    );
  }
}
