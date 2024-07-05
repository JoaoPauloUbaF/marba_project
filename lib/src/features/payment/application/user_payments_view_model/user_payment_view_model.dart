import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
