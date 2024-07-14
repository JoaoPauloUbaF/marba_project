import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/payment/application/user_payments_view_model/user_payment_view_model.dart';
import 'package:project_marba/src/features/payment/presentation/widgets/credit_card_actions_buttons.dart';
import 'package:project_marba/src/features/payment/presentation/widgets/credit_card_carousel.dart';
import 'package:project_marba/src/features/payment/presentation/widgets/payment_history_widget.dart';

class UserPaymentView extends ConsumerWidget {
  const UserPaymentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final viewModel = ref.watch(userPaymentViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meios de Pagamento', style: textTheme.headlineSmall),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Cartões de Crédito',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    viewModel.addCard(context);
                  },
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    Icons.add_sharp,
                    color: colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          const Gap(16),
          const CreditCardCarousel(),
          const CreditCardActionsButtons(),
          const Gap(8),
          const PaymentHistoryWidget(),
        ],
      ),
    );
  }
}
