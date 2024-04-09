import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_controller/cart_item_list_controller.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delivery_provider.g.dart';

@riverpod
Future<String> deliveryTax(DeliveryTaxRef ref) async {
  final cartOffers = ref.read(cartItemListProvider);
  double totalDeliveryFee = 0.0;
  for (final offer in cartOffers) {
    totalDeliveryFee += await ref
        .watch(businessProfileDataProvider)
        .getBusinessDeliveryFee(offer.businessId);
  }

  return RegistrationUtils()
      .formatAsCurrency(totalDeliveryFee); //TODO: implementar entrega total
}
