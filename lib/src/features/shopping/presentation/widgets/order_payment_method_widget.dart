import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/shared/widgets/medium_vertical_space_widget.dart';

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

enum PaymentMethod {
  creditCard,
  pix,
  boleto,
}

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
  PaymentMethod selectedPaymentMethod = PaymentMethod.pix;
  bool isAddingCard = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: !isAddingCard,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalSpaceMediumWidget(),
                  Container(
                    height: 8,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const VerticalSpaceMediumWidget(),
                  Text('Selecione um meio de pagamento',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                      child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                      ListTile(
                        title: const Text('Cartão de Crédito'),
                        subtitle: const Text('**** **** **** 1234'),
                        onTap: () => setState(() {
                          isAddingCard = true;
                        }),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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
                            setState(() {
                              selectedPaymentMethod = PaymentMethod.creditCard;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Novo Cartão de Crédito'),
                        onTap: () => setState(() {
                          isAddingCard = true;
                        }),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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
                          isSelected:
                              selectedPaymentMethod == PaymentMethod.pix,
                          onPressed: () {
                            setState(() {
                              selectedPaymentMethod = PaymentMethod.pix;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Boleto'),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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
                          isSelected:
                              selectedPaymentMethod == PaymentMethod.boleto,
                          onPressed: () {
                            setState(() {
                              selectedPaymentMethod = PaymentMethod.boleto;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Visibility(
              visible: isAddingCard,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const VerticalSpaceMediumWidget(),
                    Container(
                      // Container
                      height: 8,
                      width: MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const VerticalSpaceMediumWidget(),
                    Text('Adicionar Cartão de Crédito',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const VerticalSpaceMediumWidget(),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Número do Cartão',
                        hintText: '1234 5678 9012 3456',
                      ),
                    ),
                    const VerticalSpaceMediumWidget(),
                    TextFormField(
                      decoration: const InputDecoration(
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
                              labelText: 'Validade',
                              hintText: 'MM/AA',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'CVV',
                              hintText: '123',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpaceMediumWidget(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isAddingCard = false;
                        });
                      },
                      child: const Text('Adicionar'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
