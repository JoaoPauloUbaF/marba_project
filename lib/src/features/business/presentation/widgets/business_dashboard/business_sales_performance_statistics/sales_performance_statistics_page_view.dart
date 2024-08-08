import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
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
    final now = DateTime.now();
    final dates =
        List<DateTime>.generate(7, (i) => now.subtract(Duration(days: i)));
    return Column(
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

                return Padding(
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
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) {
                log('Error: $error');
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text('Houve um erro ao buscar os dados de vendas.'),
                  ),
                );
              },
            ),
        SalesListWidget(dates: dates)
      ],
    );
  }
}

class SalesListWidget extends StatelessWidget {
  const SalesListWidget({
    super.key,
    required this.dates,
  });

  final List<DateTime> dates;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dates.length, // replace with your list of dates
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat('yyyy/MM/dd')
                        .format(dates[index].toLocal()), // format the date
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          '$index',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${RegistrationUtils().doubleAsCurrency(100.00)}\n',
                                style: DefaultTextStyle.of(context).style,
                              ),
                              TextSpan(
                                text:
                                    RegistrationUtils().doubleAsCurrency(50.00),
                                style: DefaultTextStyle.of(context).style,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
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
              range = DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 1)),
                  end: DateTime.now());
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
