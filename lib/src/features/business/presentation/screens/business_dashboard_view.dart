import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
          Tab(text: 'Histórico'),
          Tab(text: 'Estatísticas'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BusinessOrdersPageView(),
          HistoryPage(),
          PerformanceStatisticsPage(),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History Page'),
    );
  }
}

class PerformanceStatisticsPage extends StatelessWidget {
  const PerformanceStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Performance Statistics Page'),
    );
  }
}
