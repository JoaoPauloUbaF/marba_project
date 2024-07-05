import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/payment/application/user_payments_view_model/user_payment_view_model.dart';

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
          const Gap(16),
          const CreditCardActionsButtons(),
          const Gap(8),
          const PaymentHistoryWidget(),
        ],
      ),
    );
  }
}

class CreditCardActionsButtons extends StatelessWidget {
  const CreditCardActionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const Gap(16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Editar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.onInverseSurface,
                foregroundColor: colorScheme.primary,
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              label: const Text('Excluir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
              ),
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}

class CreditCardCarousel extends StatelessWidget {
  const CreditCardCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [
        CreditCardWidget(
          cardHolderName: '',
          cardNumber: '',
          expiryDate: '',
          cardLogoAssetPath: '',
          emptyCard: true,
        ),
        CreditCardWidget(
          cardHolderName: 'John Doe',
          cardNumber: '1234 5678 9012 3456',
          expiryDate: '12/24',
          cardLogoAssetPath: 'assets/payment_methods/mastercad.png',
          emptyCard: false,
        ),
        CreditCardWidget(
          cardHolderName: 'John Doe',
          cardNumber: '1234 5678 9012 3456',
          expiryDate: '12/24',
          cardLogoAssetPath: 'assets/payment_methods/visa.png',
          emptyCard: false,
        ),
        CreditCardWidget(
          cardHolderName: 'John Doe',
          cardNumber: '1234 5678 9012 3456',
          expiryDate: '12/24',
          cardLogoAssetPath: 'assets/payment_methods/mastercad.png',
          emptyCard: false,
        ),
      ],
      options: CarouselOptions(
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: .8,
        initialPage: 1,
        aspectRatio: 2,
      ),
    );
  }
}

class PaymentHistoryWidget extends StatelessWidget {
  const PaymentHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: colorScheme.onInverseSurface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Histórico de pagamentos',
                  style: textTheme.titleLarge
                      ?.copyWith(color: colorScheme.primary)),
            ),
            const Gap(8),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('José Pedreiro - Lavras'),
                    subtitle:
                        const Text('R\$ 100,00 - Crédito \n12/12/2021 12:00'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: colorScheme.primary),
                    isThreeLine: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardWidget extends ConsumerWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cardLogoAssetPath;
  final bool emptyCard;

  const CreditCardWidget({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardLogoAssetPath,
    required this.emptyCard,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(userPaymentViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.tertiary.withOpacity(.3),
              blurRadius: 2,
              offset: const Offset(-5, 5),
            ),
          ],
          gradient: const LinearGradient(
            colors: [Colors.black87, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: emptyCard
              ? [
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        viewModel.addCard(context);
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        'Adicionar Cartão de Crédito',
                        style: textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]
              : [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      cardHolderName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      cardNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 22,
                    right: 20,
                    child: Text(
                      expiryDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Image.asset(
                      cardLogoAssetPath,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
