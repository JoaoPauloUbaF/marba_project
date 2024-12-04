import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/notification_view_model.dart/notification_view_model.dart';

class NotificationsView extends ConsumerWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final viewModel = ref.watch(notificationsViewModelProvider.notifier);
    final tuple = ref.watch(notificationsViewModelProvider);
    final bool order = tuple.item1;
    final bool email = tuple.item2;
    final bool push = tuple.item3;
    final bool whatsapp = tuple.item4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              value: order,
              onChanged: (value) {
                viewModel.toggleOrderNotifications(value);
              },
              title: const Text('Pedidos em andamento'),
              subtitle: const Text(
                  'Ative para acompanhar pedidos em andamento pela barra de notificações'),
              secondary:
                  Icon(Icons.delivery_dining, color: colorScheme.tertiary),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                SwitchListTile(
                  value: email,
                  onChanged: (value) {
                    viewModel.toggleEmailNotifications(value);
                  },
                  title: const Text('Email'),
                  secondary: Icon(Icons.email, color: colorScheme.tertiary),
                ),
                SwitchListTile(
                  value: push,
                  onChanged: (value) {
                    viewModel.togglePushNotifications(value);
                  },
                  title: const Text('Push'),
                  secondary:
                      Icon(Icons.notifications, color: colorScheme.tertiary),
                ),
                SwitchListTile(
                  value: whatsapp,
                  onChanged: (value) {
                    viewModel.toggleWhatsappNotifications(value);
                  },
                  title: const Text('Whatsapp'),
                  secondary: Icon(Icons.sms, color: colorScheme.tertiary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
