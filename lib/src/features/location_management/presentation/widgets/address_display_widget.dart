import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../../core/models/address/address.dart';
import '../../application/address_view_model/address_view_model.dart';

class AddressDisplayWidget extends ConsumerWidget {
  final Address address;
  final bool isEditable;
  final bool isBusinessAddress;

  const AddressDisplayWidget({
    super.key,
    required this.address,
    required this.isEditable,
    required this.isBusinessAddress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final addressViewModel = ref.watch(addressViewModelProvider.notifier);

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        onTap: isEditable
            ? () => addressViewModel.onAddressTileTap(
                context, address, isBusinessAddress)
            : null,
        leading: const Icon(Icons.location_on_sharp),
        title: Text(
          '${address.street}, ${address.number}, ${address.neighborhood}',
          style: textTheme.titleMedium,
        ),
        subtitle: Text(
          '${address.city} - ${address.state}',
          style: textTheme.bodyMedium,
        ),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => {
            MapsLauncher.launchQuery(
                '${address.street}, ${address.number}, ${address.city}')
          },
          icon: const Icon(Icons.directions_sharp, size: 30.0),
        ),
      ),
    );
  }
}
