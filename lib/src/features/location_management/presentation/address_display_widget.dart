import 'package:flutter/material.dart';

import '../../../shared/models/address/address.dart';

class AddressDisplayWidget extends StatelessWidget {
  final Address address;

  const AddressDisplayWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.location_on),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                '${address.street}, ${address.number} , ${address.neighborhood}, ${address.zipCode}, ${address.city} - ${address.state}',
                style: textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
