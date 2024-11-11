import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/credit_card/credit_card_model.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import '../../../user_profile/data/user_profile_provider.dart';
import '../../presentation/widgets/payment_modal_content_widget.dart';

part 'user_payment_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserPaymentViewModel extends _$UserPaymentViewModel {
  int currentIndex = 1;

  @override
  FutureOr<void> build() {}

  void onCardChanged(int index) {
    currentIndex = index;
  }

  void addCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: .75,
      builder: (context) => const AddCardModalWidget(),
    );
  }

  Future<void> saveCard({
    required String cardNumber,
    required String cardHolderName,
    required String expirationDate,
    required String? cardBrand,
    required String cvv,
    required GlobalKey<FormState> formKey,
  }) async {
    if (cardBrand == null) return;
    final creditCard = CreditCardModel(
      id: const Uuid().v4(),
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      expirationDate: expirationDate,
      cvv: cvv,
      brand: cardBrand,
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

  String? getCreditCardBrand(String cardNumber) {
    if (cardNumber.isEmpty || cardNumber.length < 4) return null;
    String cleanedCardNumber = cardNumber.replaceAll(RegExp(r'[\s-]'), '');

    if (cleanedCardNumber.startsWith('4')) {
      return 'assets/payment_methods/visa.png';
    }
    int firstTwoDigits = int.parse(cleanedCardNumber.substring(0, 2));
    int firstFourDigits = int.parse(cleanedCardNumber.substring(0, 4));
    if ((firstTwoDigits >= 51 && firstTwoDigits <= 55) ||
        (firstFourDigits >= 2221 && firstFourDigits <= 2720)) {
      return 'assets/payment_methods/mastercard.png';
    }
    return null;
  }

  validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    // Ensure the format is exactly 5 characters (mm/yy)
    if (value.length != 5 || !value.contains('/')) {
      return 'Formato inválido';
    }
    final parts = value.split('/');
    if (parts.length != 2) {
      return 'Formato inválido';
    }
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(
        '20${parts[1]}'); // Assuming yy format, prepend '20' for the year
    if (month == null || year == null) {
      return 'Data inválida';
    }
    if (month < 1 || month > 12) {
      return 'Mês inválido';
    }
    final currentDate = DateTime.now();
    final expiryDate = DateTime(year, month);
    // Check if the expiry date is before the current date
    if (expiryDate.isBefore(DateTime(currentDate.year, currentDate.month))) {
      return 'Data inválida';
    }
  }

  validateCardNumber(String? value, {String? cardBrand}) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (cardBrand == null) {
      return 'Cartão inválido';
    }
    // if (cardBrand == 'assets/payment_methods/visa.png' &&
    //     !RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(value)) {
    //   return 'Cartão inválido';
    // }
    // if (cardBrand == 'assets/payment_methods/mastercad.png' &&
    //     !RegExp(r'^5[1-5][0-9]{14}$').hasMatch(value)) {
    //   return 'Cartão inválido';
    // }
  }

  validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (value.length != 3) {
      return 'CVV inválido';
    }
  }

  Future<void> onSaveCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    String? cardBrand,
    required String cvv,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    if (kDebugMode) {
      cardNumber = '4111111111111111';
      cardHolderName = 'John Doe';
      expiryDate = '12/25';
      cardBrand = 'assets/payment_methods/visa.png';
      cvv = '123';
    }
    if (formKey.currentState?.validate() == false && !kDebugMode) {
      return;
    }
    showLoader(context);
    await saveCard(
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      expirationDate: expiryDate,
      cardBrand: cardBrand,
      cvv: cvv,
      formKey: formKey,
    ).then((value) {
      hideLoader(context);
      currentIndex = currentIndex + 1;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: const Text('Cartão de Crédito Adicionado'),
          action: SnackBarAction(
            label: 'Fechar',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
      Navigator.of(context).pop();
    }).catchError((error) {
      hideLoader(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(error.toString()),
            action: SnackBarAction(
              label: 'Fechar',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )),
      );
    });
  }

  Future<void> deleteCard() async {
    final cardList = ref.read(creditCardListProvider).hasValue
        ? ref.read(creditCardListProvider).requireValue
        : [];
    if (cardList.isEmpty || currentIndex == 0) return;
    final card = cardList[currentIndex - 1];
    final user = ref.watch(currentUserProvider)?.copyWith(
          creditCards: [
            ...ref.watch(currentUserProvider)?.creditCards ?? [],
          ]..remove(card),
        );
    if (user != null) {
      await ref.read(userProfileDataProvider).updateProfile(user: user);
    }
  }

  Future<void> onDeleteCard(BuildContext context) async {
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Cartão'),
        content: const Text('Tem certeza que deseja excluir este cartão?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    ).then((value) async {
      if (value == true) {
        showLoader(context);
        await deleteCard().then((value) {
          hideLoader(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cartão excluído com sucesso!'),
            ),
          );
        }).catchError((error) {
          hideLoader(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
            ),
          );
        });
      }
    });
  }
}

@riverpod
Stream<List<CreditCardModel>> creditCardList(CreditCardListRef ref) {
  return ref.watch(userProfileDataProvider).getCreditCards(
        userId: ref.watch(currentUserProvider)?.id ?? '',
      );
}

class ViewModelTest {
  // Talvez?
  final WidgetRef ref;

  ViewModelTest(this.ref);

  AsyncValue getCreditCardList() {
    return ref.watch(creditCardListProvider);
  }
}
