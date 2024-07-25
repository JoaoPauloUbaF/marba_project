import 'package:flutter/material.dart';
import '../widgets/business_settings/delivery_settings/delivery_settings_modal_widget.dart';

class BusinessSettingsView extends StatelessWidget {
  const BusinessSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Geral'),
            onTap: () {
              // Navigate to general settings screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.delivery_dining),
            title: const Text('Entrega'),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const DeliverySettingsModalWidget();
                  });
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Segurança'),
            onTap: () {
              // Navigate to security settings screen
            },
          ),
        ],
      ),
    );
  }
}
