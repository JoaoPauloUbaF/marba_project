import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gap/gap.dart";
import "package:project_marba/src/core/widgets/base_modal_body_widget.dart";
import "package:project_marba/src/core/widgets/modal_center_top_line_widget.dart";
import "package:project_marba/src/features/payment/presentation/views/user_payment_view.dart";

import "../../../../core/widgets/medium_vertical_space_widget.dart";
import "../../application/payment_method_view_model/payment_method_view_model.dart";

class PaymentModalContentWidget extends ConsumerStatefulWidget {
  const PaymentModalContentWidget({
    super.key,
  });

  @override
  ConsumerState<PaymentModalContentWidget> createState() =>
      _PaymentModalContentWidgetState();
}

class _PaymentModalContentWidgetState
    extends ConsumerState<PaymentModalContentWidget> {
  bool isAddingCard = false;
  @override
  Widget build(BuildContext context) {
    final selectedPaymentMethod = ref.watch(paymentMethodViewModelProvider);
    final paymentViewModel = ref.read(paymentMethodViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalSpaceMediumWidget(),
            const ModalCenterTopLineWidget(),
            const VerticalSpaceMediumWidget(),
            Text(
              'Selecione um meio de pagamento',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                ListTile(
                  title: const Text('Cartão de Crédito'),
                  subtitle: const Text('**** **** **** 1234'),
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const AddCardModalWidget(),
                  ),
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
                  trailing: IconButton(
                    selectedIcon: Icon(
                      Icons.check_circle_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    icon: Icon(
                      Icons.check_circle_outline_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    isSelected:
                        selectedPaymentMethod == PaymentMethod.creditCard,
                    onPressed: () {
                      paymentViewModel
                          .setPaymentMethod(PaymentMethod.creditCard);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Novo Cartão de Crédito'),
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const AddCardModalWidget(),
                  ),
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
                  trailing: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  title: const Text('Pix'),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.qr_code, size: 30),
                    ),
                  ),
                  trailing: IconButton(
                    selectedIcon: Icon(
                      Icons.check_circle_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    icon: Icon(
                      Icons.check_circle_outline_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    isSelected: selectedPaymentMethod == PaymentMethod.pix,
                    onPressed: () {
                      paymentViewModel.setPaymentMethod(PaymentMethod.pix);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Boleto'),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.request_page_sharp, size: 30),
                    ),
                  ),
                  trailing: IconButton(
                    selectedIcon: Icon(
                      Icons.check_circle_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    icon: Icon(
                      Icons.check_circle_outline_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    isSelected: selectedPaymentMethod == PaymentMethod.boleto,
                    onPressed: () {
                      paymentViewModel.setPaymentMethod(PaymentMethod.boleto);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardModalWidget extends StatelessWidget {
  const AddCardModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseModalBodyWidget(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 30, left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Adicionar Cartão de Crédito',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const Gap(8),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              child: const CreditCardWidget(
                  cardHolderName: 'cardHolderName',
                  cardNumber: 'cardNumber',
                  expiryDate: 'expiryDate',
                  cardLogoAssetPath: 'assets/payment_methods/visa.png',
                  emptyCard: false),
            ),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número do Cartão',
                hintText: '1234 5678 9012 3456',
              ),
            ),
            const VerticalSpaceMediumWidget(),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do Titular',
                hintText: 'João da Silva',
              ),
            ),
            const VerticalSpaceMediumWidget(),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Validade',
                      hintText: 'MM/AA',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: '123',
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
