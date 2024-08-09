import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tuple/tuple.dart';

part 'business_sales_view_model.g.dart';

class BusinessSalesViewModel {
  final WidgetRef ref;

  const BusinessSalesViewModel({required this.ref});

  void pickDateRange() async {
    // Implementation
  }

  Future<void> fetchOrdersData({required businessId}) {
    throw UnimplementedError();
  }

  AsyncValue<List<BusinessOrder>> fetchSalesData() {
    return ref.watch(businessSaleDataProvider);
  }

  Tuple3 calculateSalesPerformance({required List<BusinessOrder> sales}) {
    double totalSales = 0;
    double totalCosts = 0;
    double totalProfit = 0;

    for (final sale in sales) {
      for (var item in sale.items) {
        totalSales += item.price;
        totalCosts += item.cost;
      }
    }

    totalProfit = totalSales - totalCosts;
    return Tuple3(totalSales, totalCosts, totalProfit);
  }

  Map<String, List<BusinessOrder>> groupOrdersByDate(
      List<BusinessOrder> orders) {
    final Map<String, List<BusinessOrder>> ordersByDate = {};

    for (var order in orders) {
      final dateKey =
          DateFormat('yyyy/MM/dd').format(order.createdAt.toLocal());
      if (ordersByDate.containsKey(dateKey)) {
        ordersByDate[dateKey]!.add(order);
      } else {
        ordersByDate[dateKey] = [order];
      }
    }

    return ordersByDate;
  }
}

@riverpod
Stream<List<BusinessOrder>> businessSaleData(BusinessSaleDataRef ref) {
  final businessId = ref.read(businessProfileViewModelProvider)?.id;
  final dateRange = ref.watch(salesDateTimeRangeFilterProvider);

  return Stream.fromFuture(Future.delayed(const Duration(seconds: 1)))
      .asyncExpand((_) {
    return ref
        .read(businessOrdersRepositoryProvider)
        .getOrdersWithQuery(businessId: businessId ?? '', queryParameters: {
      'isGreaterThanOrEqualTo': {
        'createdAt': Timestamp.fromDate(dateRange.start)
      },
      'isLessThanOrEqualTo': {'createdAt': Timestamp.fromDate(dateRange.end)},
      'isNotEqualTo': {'status': BusinessOrderStatus.canceled.toString()},
    });
  });
}

@riverpod
class SalesDateTimeRangeFilter extends _$SalesDateTimeRangeFilter {
  @override
  DateTimeRange build() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day); // Meia-noite de hoje
    final end = now; // Agora
    return DateTimeRange(start: start, end: end);
  }

  void setRange(DateTimeRange range) {
    state = range;
  }
}
