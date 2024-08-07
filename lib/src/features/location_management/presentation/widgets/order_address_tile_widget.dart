import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_tile_content_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_to_sign_in_widget.dart';

import '../../../authentication/data/firebase_auth_provider.dart';

class OrderAddressTileWidget extends ConsumerWidget {
  const OrderAddressTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAddress = ref.watch(deliveryAddressProvider);
    final authState = ref.watch(authStateChangeProvider).requireValue;
    return orderAddress.when(
      data: (address) {
        if (authState == null) {
          return const OrderAddressToSignInWidget();
        }
        return OrderAddressTileContentWidget(address: address);
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Erro: $error'),
    );
  }
}
