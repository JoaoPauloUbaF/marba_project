import 'package:flutter/material.dart';

import '../../../../core/models/address/address.dart';
import 'order_address_form_widget.dart';

class AddressDisplayWidget extends StatelessWidget {
  final Address address;

  const AddressDisplayWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              content: AddressFormModalWidget(
                currentAddress: address,
                title: 'Editar Endereço',
              ),
            );
          },
        );
      },
      child: Card(
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
      ),
    );
  }
}