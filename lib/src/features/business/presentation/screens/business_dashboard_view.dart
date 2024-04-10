import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/models/order/order.dart';

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
        tabs: [
          const Tab(text: 'Pedidos'),
          const Tab(text: 'Histórico'),
          const Tab(text: 'Estatísticas'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const OrdersPage(),
          const HistoryPage(),
          const PerformanceStatisticsPage(),
        ],
      ),
    );
  }
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool _isGridMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: ToggleButtons(
                isSelected: [_isGridMode, !_isGridMode],
                onPressed: (index) {
                  setState(() {
                    _isGridMode = index == 0;
                  });
                },
                children: const [
                  Icon(Icons.grid_view),
                  Icon(Icons.list),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: _isGridMode ? _buildGridView() : _buildListView(),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10, // You can replace this with your actual order list length
      itemBuilder: (context, index) {
        return OrderListItem(
          order: _getOrderData(index),
        );
      },
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount:
            10, // You can replace this with your actual order list length
        itemBuilder: (context, index) {
          return OrderGridItem(
            order: _getOrderData(index),
          );
        },
      ),
    );
  }

  Order _getOrderData(int index) {
    return Order(
      id: '123456',
      customerId: '789',
      businessOrders: [],
      total: 100.0,
      totalDeliveryFee: 10.0,
      discount: 5.0,
      address: Address(
        street: '123 Main St',
        city: 'Springfield',
        state: 'IL',
        zipCode: '62701',
        neighborhood: 'Downtown',
        number: '123',
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      canceledAt: null,
    );
  }
}

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          // Navigate to order details page
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #${order.id}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Date: ${order.createdAt.toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text(
                'Status: Delivered',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${order.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderGridItem extends StatelessWidget {
  final Order order;

  const OrderGridItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Navigate to order details page
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #${order.id}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Date: ${order.createdAt.toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text(
                'Status: Delivered',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${order.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History Page'),
    );
  }
}

class PerformanceStatisticsPage extends StatelessWidget {
  const PerformanceStatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Performance Statistics Page'),
    );
  }
}
