import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/business/application/business_sales_view_model/business_sales_view_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_sales_performance_statistics/sales_list_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_sales_performance_statistics/sales_performance_data_summary_widget.dart';

import 'time_span_selection_widget.dart';

class SalesPerformanceStatisticsPageView extends ConsumerStatefulWidget {
  const SalesPerformanceStatisticsPageView({super.key});

  @override
  ConsumerState<SalesPerformanceStatisticsPageView> createState() =>
      _SalesPerformanceStatisticsPageViewState();
}

class _SalesPerformanceStatisticsPageViewState
    extends ConsumerState<SalesPerformanceStatisticsPageView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = BusinessSalesViewModel(ref: ref);

    return SingleChildScrollView(
      child: Column(
        children: [
          const TimeSpanSelectionWidget(),
          viewModel.fetchSalesData().when(
                data: (salesData) {
                  if (salesData.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text('Nenhuma venda encontrada.'),
                      ),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SalesPerformanceDataSummaryWidget(
                          viewModel: viewModel,
                          salesData: salesData,
                        ),
                      ),
                      SalesListWidget(orders: salesData, viewModel: viewModel),
                    ],
                  );
                },
                loading: () => Center(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const LoadingWidget())),
                error: (error, stackTrace) {
                  log('Error: $error');
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child:
                          Text('Houve um erro ao buscar os dados de vendas.'),
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }
}
