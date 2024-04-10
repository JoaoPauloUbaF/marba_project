import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/widgets/modal_center_top_line_widget.dart';

class CalendarModalWidget extends ConsumerStatefulWidget {
  const CalendarModalWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalendarModalWidgetState();
}

class _CalendarModalWidgetState extends ConsumerState<CalendarModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const ModalCenterTopLineWidget(),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(), //TODO: Schedule implementation
          ),
        ],
      ),
    );
  }
}
