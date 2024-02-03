import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notification Settings'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Account Settings'),
            onTap: () {
              ref.read(authRepositoryProvider).getCurrentUser() != null
                  ? Navigator.pushNamed(context, '/profile')
                  : Navigator.pushReplacementNamed(context, '/sign-in');
            },
          ),
          ListTile(
            title: Text('Privacy Settings'),
            onTap: () {
              // TODO: Implement privacy settings
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              // TODO: Implement about screen
            },
          ),
        ],
      ),
    );
  }
}
