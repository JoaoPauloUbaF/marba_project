import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';

import '../../application/user_payments_view_model/user_payment_view_model.dart';

class CreditCardActionsButtons extends ConsumerWidget {
  const CreditCardActionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(userPaymentViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: SizedBox(
        width: isWideScreen(context)
            ? MediaQuery.of(context).size.width * .4
            : MediaQuery.of(context).size.width * .8,
        child: ElevatedButton.icon(
          onPressed: () async {
            await viewModel.onDeleteCard(context);
          },
          icon: const Icon(Icons.delete),
          label: const Text('Excluir'),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
          ),
        ),
      ),
    );
  }
}
