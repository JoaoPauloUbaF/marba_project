import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/payment/application/user_payments_view_model/user_payment_view_model.dart';

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
