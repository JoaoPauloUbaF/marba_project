import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/order/business_order_model.dart';
import '../../../orders/data/business_orders_repository/business_orders_repository_provider.dart';
import '../../presentation/widgets/business_dashboard/business_open_orders/business_order_details_modal_body.dart';

part 'business_orders_view_model.g.dart';

@riverpod
class BusinessOrdersViewModel extends _$BusinessOrdersViewModel {
  @override
  Stream<List<BusinessOrder>> build() {
    final businessId = ref.watch(businessProfileViewModelProvider)?.id;
    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    final businessOrders = ref
        .watch(businessOrdersRepositoryProvider)
        .getOrders(businessId: businessId);
    return businessOrders;
  }

  Color? getCardColor({required BusinessOrderStatus status}) {
    switch (status) {
      case BusinessOrderStatus.waitingConfirmation:
        return Colors.orange[900]?.withAlpha(150);
      case BusinessOrderStatus.delivered:
        return Colors.green[900]?.withAlpha(100);
      case BusinessOrderStatus.done:
        return Colors.green[900]?.withAlpha(100);
      case BusinessOrderStatus.accepted:
        return Colors.teal[900]?.withAlpha(100);
      case BusinessOrderStatus.preparing:
        return Colors.yellow[900]?.withAlpha(100);
      case BusinessOrderStatus.delivering:
        return Colors.orange[900]?.withAlpha(100);
      case BusinessOrderStatus.canceled:
        return Colors.red[900]?.withAlpha(100);
      default:
        return Colors.grey[900]?.withAlpha(100);
    }
  }

  Color? getStatusTextColor({required BusinessOrderStatus status}) {
    switch (status) {
      case BusinessOrderStatus.waitingConfirmation:
        return Colors.orange[100];
      case BusinessOrderStatus.delivered:
        return Colors.green[100];
      case BusinessOrderStatus.done:
        return Colors.green[100];
      case BusinessOrderStatus.accepted:
        return Colors.teal[100];
      case BusinessOrderStatus.preparing:
        return Colors.yellow[100];
      case BusinessOrderStatus.delivering:
        return Colors.orange[100];
      case BusinessOrderStatus.canceled:
        return Colors.red[100];
      default:
        return Colors.grey[100];
    }
  }

  String getStatusTranslation(String status) {
    switch (status) {
      case 'waitingConfirmation':
        return 'A confirmar';
      case 'accepted':
        return 'Aceito';
      case 'preparing':
        return 'Preparando';
      case 'delivering':
        return 'Entregando';
      case 'delivered':
        return 'Entregue';
      case 'done':
        return 'Concluído';
      case 'canceled':
        return 'Cancelado';
      default:
        return '';
    }
  }

  void openOrderDetails(
      {required BusinessOrder order, required BuildContext context}) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: .8,
      context: context,
      builder: (context) {
        return BusinessOrderDetailModalBody(orderId: order.id);
      },
    );
  }
}

@Riverpod(keepAlive: true)
Stream<BusinessOrder?> selectedOrder(SelectedOrderRef ref, String orderId) {
  return ref
      .read(businessOrdersRepositoryProvider)
      .getBusinessOrderById(orderId: orderId);
}
