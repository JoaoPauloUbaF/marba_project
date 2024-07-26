import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BusinessOpeningHoursUpdateDialog extends StatefulWidget {
  final Map<String, String> openingHours;
  const BusinessOpeningHoursUpdateDialog(
      {super.key, required this.openingHours});

  @override
  BusinessOpeningHoursUpdateDialogState createState() =>
      BusinessOpeningHoursUpdateDialogState();
}

class BusinessOpeningHoursUpdateDialogState
    extends State<BusinessOpeningHoursUpdateDialog> {
  // Map para armazenar os horários de abertura
  final Map<String, String> openingHours = {
    for (var day in weekDays.keys) day: ''
  };

  // Map para armazenar o estado dos dias fechados
  final Map<String, bool> isClosed = {
    for (var day in weekDays.keys) day: false
  };

  @override
  void initState() {
    super.initState();
    widget.openingHours.forEach((key, value) {
      openingHours[key] = value;
      isClosed[key] = value == 'Fechado';
    });
  }

  bool sameHoursForWeekdays = false;

  void _fillWeekdaysWithSameHours() {
    if (sameHoursForWeekdays) {
      final String? hours = openingHours[weekDays.keys.elementAt(0)];
      if (hours != null && hours.isNotEmpty) {
        for (var day in weekDays.keys.skip(1).take(4)) {
          openingHours[day] = hours;
        }
      }
    }
  }

  Future<void> _selectTime(
      BuildContext context, String day, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        final text = openingHours[day] ?? '';
        final times = text.split(' - ');
        if (times.length < 2) {
          times.add('00:00');
        }
        if (isStartTime) {
          openingHours[day] = '${picked.format(context)} - ${times[1]}';
        } else {
          openingHours[day] = '${times[0]} - ${picked.format(context)}';
        }

        if (sameHoursForWeekdays && day == weekDays.keys.elementAt(0)) {
          _fillWeekdaysWithSameHours();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(updateOpeningHoursTitle,
                  style: textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Text(updateOpeningHoursSubtitle,
                  style: textTheme.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: sameHoursForWeekdays,
                    onChanged: (value) {
                      setState(() {
                        sameHoursForWeekdays = value!;
                        if (value) {
                          _fillWeekdaysWithSameHours();
                        } else {
                          openingHours.forEach((key, value) {
                            openingHours[key] = '';
                          });
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Usar o mesmo horário para dias de semana (preencha o horário de segunda-feira)',
                      style: textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ...openingHours.keys
                  .map((day) => _buildOpeningHourField(day, textTheme)),
              const SizedBox(height: 20),
              ButtonBar(children: [
                ElevatedButton(
                  onPressed: () {
                    final result = {
                      for (var day in openingHours.keys)
                        day: isClosed[day]!
                            ? 'Fechado'
                            : (openingHours[day]!.isEmpty
                                ? 'Fechado'
                                : openingHours[day]!)
                    };
                    Navigator.of(context).pop(result);
                  },
                  child: const Text('Salvar'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpeningHourField(String day, TextTheme textTheme) {
    final times = openingHours[day]?.split(' - ') ?? ['00:00', '00:00'];
    if (times.length < 2) {
      times.add('00:00');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day,
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            Checkbox(
              value: isClosed[day],
              onChanged: (value) {
                setState(() {
                  isClosed[day] = value!;
                  if (value) {
                    openingHours[day] = 'Fechado';
                  } else {
                    openingHours[day] = '';
                  }
                });
              },
            ),
            Text('Fechado', style: textTheme.bodyMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: isClosed[day]!
              ? [Text('Fechado', style: textTheme.bodyLarge)]
              : [
                  GestureDetector(
                    onTap: () => _selectTime(context, day, true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        times[0].isEmpty ? '00:00' : times[0],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const Gap(4),
                  const Text(' às '),
                  const Gap(4),
                  GestureDetector(
                    onTap: () => _selectTime(context, day, false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        times[1].isEmpty ? '00:00' : times[1],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
        ),
      ],
    );
  }
}

// Variáveis de texto
const String updateOpeningHoursTitle = 'Atualizar horários de funcionamento';
const String updateOpeningHoursSubtitle =
    'Selecione os dias e horários que seu negócio está aberto';

// Map com os dias da semana
const Map<String, String> weekDays = {
  'Segunda-feira': '',
  'Terça-feira': '',
  'Quarta-feira': '',
  'Quinta-feira': '',
  'Sexta-feira': '',
  'Sábado': '',
  'Domingo': '',
};
