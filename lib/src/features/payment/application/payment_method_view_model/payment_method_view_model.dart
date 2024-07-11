import 'package:flutter/material.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/models/credit_card/credit_card_model.dart';
part 'payment_method_view_model.g.dart';

@Riverpod(keepAlive: true)
class PaymentMethodViewModel extends _$PaymentMethodViewModel {
  @override
  PaymentMethod build() {
    return PaymentMethod.pix;
  }

  String getPaymentMethodTitle() {
    switch (state) {
      case PaymentMethod.creditCard:
        return 'Cartão de Crédito';
      case PaymentMethod.pix:
        return 'Pix';
      case PaymentMethod.boleto:
        return 'Boleto';
      default:
        return 'Pix';
    }
  }

  IconData getPaymentMethodIcon() {
    switch (state) {
      case PaymentMethod.creditCard:
        return Icons.credit_card_sharp;
      case PaymentMethod.pix:
        return Icons.qr_code_sharp;
      case PaymentMethod.boleto:
        return Icons.qr_code_sharp;
      default:
        return Icons.qr_code_2;
    }
  }

  String getPaymentMethodSubtitle() {
    switch (state) {
      case PaymentMethod.creditCard:
        return 'Pague com seu cartão de crédito';
      case PaymentMethod.pix:
        return 'Pague com Pix à vista';
      case PaymentMethod.boleto:
        return 'Pague com boleto bancário';
      default:
        return 'Pague com Pix à vista';
    }
  }

  void setPaymentMethod(PaymentMethod paymentMethod) {
    state = paymentMethod;
  }
}

enum PaymentMethod {
  creditCard,
  pix,
  boleto,
}
