import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/util.dart';

import '../../application/settings_screen_controller.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(settingsScreenControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, color: colorScheme.tertiary),
            title: Text(getAppLocalizations(context).account),
            onTap: () {
              Navigator.pushNamed(context, viewController.onAccountTaped());
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_sharp, color: colorScheme.tertiary),
            title: Text(getAppLocalizations(context).chat),
            onTap: () {
              Navigator.pushNamed(context, viewController.onChatTaped());
            },
          ),
          ListTile(
            title: Text(getAppLocalizations(context).notifications),
            onTap: () {
              Navigator.pushNamed(
                  context, viewController.onNotificationTaped());
            },
            leading: Icon(Icons.notifications, color: colorScheme.tertiary),
          ),
          ListTile(
            title: Text(getAppLocalizations(context).address),
            onTap: () {
              Navigator.pushNamed(context, viewController.onAddressTaped());
            },
            leading: Icon(Icons.location_on, color: colorScheme.tertiary),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: colorScheme.tertiary),
            title: Text(getAppLocalizations(context).privacy),
            onTap: () {
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          ListTile(
            leading: Icon(Icons.business_center, color: colorScheme.tertiary),
            title: Text(getAppLocalizations(context).register_business),
            onTap: () {
              Navigator.pushNamed(
                  context, viewController.onBusinessApplyTaped());
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: colorScheme.tertiary),
            title: Text(getAppLocalizations(context).about),
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
                applicationLegalese: '© 2024 Onktem',
              );
            },
          ),
        ],
      ),
    );
  }
}
