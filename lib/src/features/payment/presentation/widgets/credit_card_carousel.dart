import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/payment/presentation/widgets/credit_card_widget.dart';

import '../../application/user_payments_view_model/user_payment_view_model.dart';

class CreditCardCarousel extends ConsumerStatefulWidget {
  const CreditCardCarousel({
    super.key,
  });

  @override
  CreditCardCarouselState createState() => CreditCardCarouselState();
}

class CreditCardCarouselState extends ConsumerState<CreditCardCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(userPaymentViewModelProvider.notifier);
    final creditCards = ref.watch(creditCardListProvider);

    return creditCards.when(
      data: (creditCards) {
        return Column(
          children: [
            CarouselSlider(
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
                initialPage: viewModel.currentIndex,
                aspectRatio: 2,
                onPageChanged: (index, reason) {
                  viewModel.onCardChanged(index);
                },
              ),
              controller: _carouselController,
            ),
          ],
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) =>
          const Center(child: Text('Erro ao carregar cartões de crédito')),
    );
  }
}
