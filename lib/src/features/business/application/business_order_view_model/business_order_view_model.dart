import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../offers_management/data/offer_data_repository_provider.dart';
import '../../../orders/data/business_orders_repository/business_orders_repository_provider.dart';
part 'business_order_view_model.g.dart';

@Riverpod(keepAlive: true)
class BusinessOrderViewModel extends _$BusinessOrderViewModel {
  @override
  BusinessOrder? build() {
    return null;
  }

  void setState({required BusinessOrder selectedOrder}) {
    state = selectedOrder;
  }

  void updateOrderStatus({required String orderId, required String newStatus}) {
    ref
        .read(businessOrdersRepositoryProvider)
        .updateOrderStatus(orderId: orderId, newStatus: newStatus)
        .then((value) => {
              businessOrderItemOfferIsProduct(
                  orderId: orderId, newStatus: newStatus),
            });
  }

  void businessOrderItemOfferIsProduct(
      {required String orderId, required String newStatus}) {
    if (newStatus == BusinessOrderStatus.done.toString().split('.').last) {
      ref
          .read(businessOrdersRepositoryProvider)
          .getOrderItems(orderId: orderId)
          .then(
            (items) async => {
              for (var item in items)
                {
                  await ref
                      .read(offersDataRepositoryProvider)
                      .getOffer(item.id)
                      .then(
                    (orderOffer) {
                      if (orderOffer.type == OfferType.product) {
                        updateBusinessOrderItemOfferAvailableQuantity(
                            offerId: orderOffer.id,
                            orderOffer: orderOffer,
                            itemQuantity: item.quantity);
                      }
                    },
                  )
                }
            },
          );
    }
  }

  Future<void> updateBusinessOrderItemOfferAvailableQuantity(
      {required String offerId,
      required OfferModel orderOffer,
      required int itemQuantity}) async {
    if (orderOffer.availableQuantity == null ||
        orderOffer.availableQuantity == 0) {
      return;
    }

    final newQuantity = orderOffer.availableQuantity! - itemQuantity;

    ref.read(offersDataRepositoryProvider).updateOfferAvailableQuantity(
        offerId: offerId, newQuantity: newQuantity);
  }
}
