import 'package:flutter/material.dart';

class OrderPaymentMethodWidget extends StatelessWidget {
  const OrderPaymentMethodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.credit_card_sharp, size: 30),
        ),
      ),
      title: Text(
        'Cartão de Crédito',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        '**** **** **** 1234',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {},
      ),
    );
  }
}
