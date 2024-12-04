import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_sales_performance_statistics/sales_performance_statistics_page_view.dart';

import '../widgets/business_dashboard/business_open_orders/business_open_orders_page_view.dart';

class BusinessDashboardView extends ConsumerStatefulWidget {
  const BusinessDashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BusinessDashboardViewState();
}

class _BusinessDashboardViewState extends ConsumerState<BusinessDashboardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Pedidos'),
          Tab(text: 'Estatísticas'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BusinessOrdersPageView(),
          SalesPerformanceStatisticsPageView(),
        ],
      ),
    );
  }
}
