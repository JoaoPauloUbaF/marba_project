import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_modal_widget.dart';

class OrderAddressTileContentWidget extends StatelessWidget {
  final AddressModel? address;

  const OrderAddressTileContentWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final addressTileTitle = address == null
        ? 'Adicionar endereço de entrega'
        : '${address!.street}, ${address!.number}, ${address!.neighborhood}, ${address!.city}';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.location_on_sharp, size: 30),
        ),
      ),
      title: Text(
        addressTileTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const BaseModalBodyWidget(
                  child: AddressesManagementWidget());
            },
          );
        },
      ),
    );
  }
}
