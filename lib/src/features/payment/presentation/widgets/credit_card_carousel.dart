import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/payment/presentation/widgets/credit_card_widget.dart';

import '../../application/user_payments_view_model/user_payment_view_model.dart';

class CreditCardCarousel extends ConsumerWidget {
  const CreditCardCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(userPaymentViewModelProvider.notifier);
    final creditCards = ref.watch(creditCardListProvider);
    return creditCards.when(
      data: (creditCards) {
        return CarouselSlider(
          items: [
            const CreditCardWidget(
              cardHolderName: '',
              cardNumber: '',
              expiryDate: '',
              cardLogoAssetPath: '',
              emptyCard: true,
            ),
            ...creditCards.map(
              (creditCard) => CreditCardWidget(
                cardHolderName: creditCard.cardHolderName,
                cardNumber: creditCard.cardNumber,
                expiryDate: creditCard.expirationDate,
                cardLogoAssetPath: creditCard.brand,
                emptyCard: false,
              ),
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
      },
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorWidget(error),
    );
  }
}
