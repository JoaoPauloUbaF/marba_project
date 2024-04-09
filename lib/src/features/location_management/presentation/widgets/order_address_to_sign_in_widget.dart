import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/application/sign_in_screen_controller.dart';

class OrderAddressToSignInWidget extends ConsumerWidget {
  const OrderAddressToSignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      title: const Text('Selecione um endereço de entrega'),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          ref
              .read(signInScreenControllerProvider.notifier)
              .setGoToRoute('/shopping-cart');
          Navigator.of(context).pushNamed('/sign-in');
        },
      ),
    );
  }
}
