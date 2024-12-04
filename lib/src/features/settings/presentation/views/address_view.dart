import 'package:flutter/material.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_modal_widget.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus endereços'),
      ),
      body: const AddressesManagementWidget(),
    );
  }
}
