import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../application/business_sales_view_model/business_sales_view_model.dart';

class TimeSpanSelectionWidget extends ConsumerStatefulWidget {
  const TimeSpanSelectionWidget({super.key});

  @override
  ConsumerState<TimeSpanSelectionWidget> createState() =>
      _TimeSpanSegmentedButtonState();
}

class _TimeSpanSegmentedButtonState
    extends ConsumerState<TimeSpanSelectionWidget> {
  Calendar calendarView = Calendar.day;
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
        calendarView = Calendar.day;
        _selectedDateRange = newDateRange;
        ref
            .read(salesDateTimeRangeFilterProvider.notifier)
            .setRange(newDateRange);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SegmentedButton<Calendar>(
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
                          start:
                              DateTime.now().subtract(const Duration(days: 7)),
                          end: DateTime.now());
                      break;
                    case Calendar.month:
                      range = DateTimeRange(
                          start:
                              DateTime.now().subtract(const Duration(days: 30)),
                          end: DateTime.now());
                      break;
                    case Calendar.year:
                      range = DateTimeRange(
                          start: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          end: DateTime.now());
                      break;
                  }

                  ref
                      .read(salesDateTimeRangeFilterProvider.notifier)
                      .setRange(range);
                  _selectedDateRange = range;

                  calendarView = newSelection.first;
                });
              },
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
              'De ${DateFormat('dd/MM/yyyy').format(_selectedDateRange!.start)} até ${DateFormat('dd/MM/yyyy').format(_selectedDateRange!.end)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
      ],
    );
  }
}

enum Calendar { day, week, month, year }
