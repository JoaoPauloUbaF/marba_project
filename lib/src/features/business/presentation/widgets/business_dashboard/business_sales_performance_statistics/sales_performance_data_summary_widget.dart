import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_sales_view_model/business_sales_view_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_sales_performance_statistics/sales_summary_card_widget.dart';

class SalesPerformanceDataSummaryWidget extends StatelessWidget {
  const SalesPerformanceDataSummaryWidget({
    super.key,
    required this.viewModel,
    required this.salesData,
  });
  final BusinessSalesViewModel viewModel;
  final List<BusinessOrder> salesData;

  @override
  Widget build(BuildContext context) {
    final salesPerformance =
        viewModel.calculateSalesPerformance(sales: salesData);
    final totalSales = salesPerformance.item1;
    final totalCosts = salesPerformance.item2;
    final totalProfit = salesPerformance.item3;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SalesSummaryCardWidget(
            title: 'Vendas',
            subtitle: 'R\$ $totalSales',
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Expanded(
          child: SalesSummaryCardWidget(
            title: 'Custos',
            subtitle: 'R\$ $totalCosts',
            color: Theme.of(context).colorScheme.error,
            textColor: Theme.of(context).colorScheme.onError,
          ),
        ),
        Expanded(
          child: SalesSummaryCardWidget(
            title: 'Lucro',
            subtitle: 'R\$ $totalProfit',
            color: Theme.of(context).colorScheme.tertiary,
            textColor: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      ],
    );
  }
}
