import 'package:flutter/material.dart';
import '../widgets/business_settings/delivery_settings/delivery_settings_modal_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BusinessSettingsView extends StatelessWidget {
  const BusinessSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.general),
            onTap: () {
              // Navigate to general settings screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.delivery_dining),
            title: Text(AppLocalizations.of(context)!.delivery),
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
            title: Text(AppLocalizations.of(context)!.security),
            onTap: () {
              // Navigate to security settings screen
            },
          ),
        ],
      ),
    );
  }
}
