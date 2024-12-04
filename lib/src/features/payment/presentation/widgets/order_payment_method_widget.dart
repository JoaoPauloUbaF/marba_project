import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/payment/application/payment_method_view_model/payment_method_view_model.dart';
import 'payment_modal_content_widget.dart';

class OrderPaymentMethodWidget extends ConsumerStatefulWidget {
  const OrderPaymentMethodWidget({
    super.key,
  });

  @override
  ConsumerState<OrderPaymentMethodWidget> createState() =>
      _OrderPaymentMethodWidgetState();
}

class _OrderPaymentMethodWidgetState
    extends ConsumerState<OrderPaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    ref.watch(paymentMethodViewModelProvider);
    final paymentViewModel = ref.read(paymentMethodViewModelProvider.notifier);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(paymentViewModel.getPaymentMethodIcon(), size: 30),
        ),
      ),
      title: Text(
        paymentViewModel.getPaymentMethodTitle(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        paymentViewModel.getPaymentMethodSubtitle(),
        style: Theme.of(context).textTheme.bodyMedium,
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
                return const PaymentModalContentWidget();
              });
        },
      ),
    );
  }
}
