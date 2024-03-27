import 'package:project_marba/src/shared/utils/registration_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delivery_provider.g.dart';

@riverpod
String deliveryTax(DeliveryTaxRef ref) {
  return RegistrationUtils().formatAsCurrency(7.0);
}
