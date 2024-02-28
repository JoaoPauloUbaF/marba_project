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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Endereço',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '${address.street}, ${address.number} , ${address.neighborhood}, ${address.zipCode}',
              ),
              const SizedBox(height: 4),
              Text(
                '${address.city} - ${address.state}',
              ),
              const SizedBox(width: 16), // to-do
            ],
          ),
        ),
      ),
    );
  }
}
