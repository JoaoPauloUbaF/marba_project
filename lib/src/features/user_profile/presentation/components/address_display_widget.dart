import 'package:flutter/material.dart';

import '../../../../shared/models/address/address.dart';

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
