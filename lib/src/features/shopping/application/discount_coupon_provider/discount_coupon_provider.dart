import 'package:project_marba/src/shared/utils/registration_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discount_coupon_provider.g.dart';

@riverpod
String shoppingCartDiscount(ShoppingCartDiscountRef ref, double total) {
  const discount = .2;
  return RegistrationUtils().formatAsCurrency(total * discount);
}
