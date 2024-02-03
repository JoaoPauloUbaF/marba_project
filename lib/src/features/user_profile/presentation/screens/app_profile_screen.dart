import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/user_profile/application/profile_screen_controller/profile_screen_controller.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

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
        FutureBuilder<Address?>(
          future: ref
              .read(profileScreenControllerProvider.notifier)
              .getUserAddress(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return AddressDisplayWidget(address: snapshot.data!);
            }
          },
        ),
      ],
    );
  }
}

class AddressDisplayWidget extends StatelessWidget {
  final Address address;

  const AddressDisplayWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'Address',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ListTile(
                title: const Text('City'),
                subtitle: Text(address.city),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: ListTile(
                title: const Text('State'),
                subtitle: Text(address.state),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ListTile(
                title: const Text('Street'),
                subtitle: Text(address.street),
              ),
            ),
            const SizedBox(width: 16), // to-do
            Flexible(
              child: ListTile(
                title: const Text('Number'),
                subtitle: Text(address.number),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ListTile(
                title: const Text('Neighborhood'),
                subtitle: Text(address.neighborhood),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: ListTile(
                title: const Text('Zip Code'),
                subtitle: Text(address.zipCode),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
