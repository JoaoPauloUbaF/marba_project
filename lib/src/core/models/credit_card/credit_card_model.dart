import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.freezed.dart';
part 'credit_card_model.g.dart';

@freezed
class CreditCardModel with _$CreditCardModel {
  factory CreditCardModel({
    required String id,
    required String cardNumber,
    required String cardHolderName,
    required String expirationDate,
    required String cvv,
    required String brand,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CreditCardModel;

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelFromJson(json);
}
