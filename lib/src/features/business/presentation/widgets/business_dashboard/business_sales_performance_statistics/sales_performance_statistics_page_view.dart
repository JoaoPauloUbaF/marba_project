import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/business/application/business_sales_view_model/business_sales_view_model.dart';

class SalesPerformanceStatisticsPageView extends ConsumerStatefulWidget {
  const SalesPerformanceStatisticsPageView({super.key});

  @override
  ConsumerState<SalesPerformanceStatisticsPageView> createState() =>
      _SalesPerformanceStatisticsPageViewState();
}

class _SalesPerformanceStatisticsPageViewState
    extends ConsumerState<SalesPerformanceStatisticsPageView> {
  DateTimeRange? _selectedDateRange;

  void _pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: _selectedDateRange,
    );

    if (newDateRange != null) {
      setState(() {
        _selectedDateRange = newDateRange;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = BusinessSalesViewModel(ref: ref);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: TimeSpanSegmentedButton(),
              ),
              FilledButton.tonal(
                onPressed: () {
                  _pickDateRange();
                },
                child: const Text(
                  'Período',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          if (_selectedDateRange != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'De ${DateFormat('yyyy/MM/dd').format(_selectedDateRange!.start)} até ${DateFormat('yyyy/MM/dd').format(_selectedDateRange!.end)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
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

                  final salesPerformance =
                      viewModel.calculateSalesPerformance(sales: salesData);
                  final totalSales = salesPerformance.item1;
                  final totalCosts = salesPerformance.item2;
                  final totalProfit = salesPerformance.item3;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Card(
                                color: Theme.of(context).colorScheme.primary,
                                child: ListTile(
                                  title: Text(
                                    'Vendas',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                  ),
                                  subtitle: Text('R\$ $totalSales',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: Theme.of(context).colorScheme.error,
                                child: ListTile(
                                  title: Text(
                                    'Custos',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onError),
                                  ),
                                  subtitle: Text(
                                    'R\$ $totalCosts',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onError),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: ListTile(
                                  title: Text(
                                    'Lucro',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary),
                                  ),
                                  subtitle: Text('R\$ $totalProfit',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary)),
                                ),
                              ),
                            ),
                          ],
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

class SalesListWidget extends StatelessWidget {
  const SalesListWidget(
      {super.key, required this.orders, required this.viewModel});

  final List<BusinessOrder> orders;
  final BusinessSalesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final ordersByDate = viewModel.groupOrdersByDate(orders);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ordersByDate.keys.length,
        itemBuilder: (context, index) {
          final date = ordersByDate.keys.elementAt(index);
          final dailyOrders = ordersByDate[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  date, // Exibe a data
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
              ...dailyOrders.map((order) {
                final orderIdPrefix = order.id.split('-').first;
                final totalItems = order.items.length;
                final totalProfit = order.items.fold<double>(
                  0,
                  (sum, item) => sum + (item.price - item.cost) * item.quantity,
                );
                final totalCosts = order.items.fold<double>(
                  0,
                  (sum, item) => sum + item.cost * item.quantity,
                );
                final totalSales = order.items.fold<double>(
                  0,
                  (sum, item) => sum + item.price * item.quantity,
                );

                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    title: Text('Pedido #$orderIdPrefix'),
                    trailing: Text('Total de items: $totalItems'),
                    subtitle: Row(
                      children: [
                        Card(
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('\$${totalSales.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                          ),
                        ),
                        Card(
                          color: Theme.of(context).colorScheme.error,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('\$${totalCosts.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onError)),
                          ),
                        ),
                        Card(
                          color: Theme.of(context).colorScheme.tertiary,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('\$${totalProfit.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class TimeSpanSegmentedButton extends ConsumerStatefulWidget {
  const TimeSpanSegmentedButton({super.key});

  @override
  ConsumerState<TimeSpanSegmentedButton> createState() =>
      _TimeSpanSegmentedButtonState();
}

class _TimeSpanSegmentedButtonState
    extends ConsumerState<TimeSpanSegmentedButton> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('D', style: TextStyle(fontSize: 12)),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('S', style: TextStyle(fontSize: 12)),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('M', style: TextStyle(fontSize: 12)),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('A', style: TextStyle(fontSize: 12)),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          DateTimeRange range;
          switch (newSelection.first) {
            case Calendar.day:
              final now = DateTime.now();
              final start = DateTime(now.year, now.month, now.day);
              range = DateTimeRange(start: start, end: DateTime.now());
              break;
            case Calendar.week:
              range = DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 7)),
                  end: DateTime.now());
              break;
            case Calendar.month:
              range = DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 30)),
                  end: DateTime.now());
              break;
            case Calendar.year:
              range = DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 365)),
                  end: DateTime.now());
              break;
          }

          ref.read(salesDateTimeRangeFilterProvider.notifier).setRange(range);

          calendarView = newSelection.first;
        });
      },
    );
  }
}
