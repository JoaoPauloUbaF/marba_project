import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';

class SalesPerformanceStatisticsPageView extends StatefulWidget {
  const SalesPerformanceStatisticsPageView({super.key});

  @override
  State<SalesPerformanceStatisticsPageView> createState() =>
      _SalesPerformanceStatisticsPageViewState();
}

class _SalesPerformanceStatisticsPageViewState
    extends State<SalesPerformanceStatisticsPageView> {
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
    final now = DateTime.now();
    final dates =
        List<DateTime>.generate(7, (i) => now.subtract(Duration(days: i)));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary),
                onPressed: _pickDateRange,
                child: Text(_selectedDateRange == null
                    ? 'Selecionar data'
                    : '${DateFormat('yyyy/MM/dd').format(_selectedDateRange!.start)} to ${DateFormat('yyyy/MM/dd').format(_selectedDateRange!.end)}'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Card(
                  color: Colors.lightGreen[700],
                  child: ListTile(
                    title: Text(
                      'Vendas',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text('R\$ 0,00',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.redAccent[700],
                  child: ListTile(
                    title: Text(
                      'Custos',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text('0',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
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
                                        '${RegistrationUtils().doubleAsCurrency(50.00)}',
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
        )
      ],
    );
  }
}
