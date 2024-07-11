import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/credit_card/credit_card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../presentation/widgets/payment_modal_content_widget.dart';

part 'user_payment_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserPaymentViewModel extends _$UserPaymentViewModel {
  @override
  FutureOr<void> build() {}

  void addCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.7,
      builder: (context) => const AddCardModalWidget(),
    );
  }

  Future<void> saveCard(
      {required String cardNumber,
      required String cardHolderName,
      required String expirationDate,
      required String cvv}) async {
    final creditCard = CreditCardModel(
      id: Uuid().v4(),
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      expirationDate: expirationDate,
      cvv: cvv,
      brand: 'visa',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final user = ref.read(currentUserProvider)?.copyWith(
      creditCards: [
        ...ref.read(currentUserProvider)?.creditCards ?? [],
        creditCard,
      ],
    );
    if (user != null) {
      await ref.read(userProfileDataProvider).updateProfile(user: user);
    }
  }
}

@riverpod
Stream<List<CreditCardModel>> creditCardList(CreditCardListRef ref) {
  return ref.read(userProfileDataProvider).getCreditCards(
        userId: ref.read(currentUserProvider)?.id ?? '',
      );
}
