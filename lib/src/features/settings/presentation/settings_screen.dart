import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key, this.shouldRenderAppBar = true});
  final bool shouldRenderAppBar;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              ref.read(authRepositoryProvider).getCurrentUser() != null
                  ? Navigator.pushNamed(context, '/profile')
                  : Navigator.pushReplacementNamed(context, '/sign-in');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.attach_money_sharp),
            title: const Text('Meus Negócios'),
            onTap: () {
              ref.read(authRepositoryProvider).getCurrentUser() != null
                  ? Navigator.pushNamed(context, '/business-list')
                  : Navigator.pushReplacementNamed(context, '/sign-in');
            },
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
