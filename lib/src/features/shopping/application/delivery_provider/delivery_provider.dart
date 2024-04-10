import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/cart_item/cart_item_model.dart';

part 'delivery_provider.g.dart';

@riverpod
Future<String> deliveryTax(DeliveryTaxRef ref,
    {required List<CartItemModel> cartOffers}) async {
  double totalDeliveryFee = 0.0;
  for (final offer in cartOffers) {
    totalDeliveryFee += await ref
        .watch(businessProfileDataProvider)
        .getBusinessDeliveryFee(offer.businessId);
  }

  return RegistrationUtils().formatAsCurrency(totalDeliveryFee);
}
