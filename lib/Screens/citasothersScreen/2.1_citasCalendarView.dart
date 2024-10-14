import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utility/demoInfos.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';


class CitasCalendarView extends StatefulWidget {
  final Function(int) onScreenChange;
  const CitasCalendarView({super.key, required this.onScreenChange});

  @override
  State<CitasCalendarView> createState() => _CitasCalendarViewState();
}

class _CitasCalendarViewState extends State<CitasCalendarView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? normalizedSelectedDay;
  @override
  Widget build(BuildContext context) {
    return Container(height: 490.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: deco2(),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2040, 12, 20),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            normalizedSelectedDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
          });
          ///single entry
          ///if (_agendaData.containsKey(normalizedSelectedDay)) {}

          if(normalizedSelectedDay!=null){
            List<String> agendaItems = agendaData.firstWhere(
                  (entry) => (entry.key.start.isBefore(normalizedSelectedDay!) ||
                  entry.key.start.isAtSameMomentAs(normalizedSelectedDay!)) &&
                  (entry.key.end.isAfter(normalizedSelectedDay!) ||
                      entry.key.end.isAtSameMomentAs(normalizedSelectedDay!)),
              orElse: () => MapEntry(DateTimeRange(start: DateTime.now(), end: DateTime.now()), <String>[]), // Return a MapEntry with an empty list
            ).value;
            if (agendaItems.isNotEmpty) {
              print("Agenda found for $normalizedSelectedDay");
              showPopover(
                context: context,
                bodyBuilder: (context) =>
                    commentPopWidget(
                        title: "title",
                        date: "date",
                        comment: "comment"
                    ),
                // onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.top,
                width: 254.w,
                height: 170.h,
                arrowHeight: 10.h,
                arrowWidth: 12.w,
                radius: 20.r,
                barrierColor: Colors.transparent
              );
            } else {
              print("No agenda found for $normalizedSelectedDay");
            }
          }
        },
        calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          todayDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
        ),
        eventLoader: (day){
          DateTime normalizedDay = DateTime(day.year, day.month, day.day);
          /// return _agendaData[normalizedDay] ?? []; single entries
          return agendaData
              .where((entry) => entry.key.start.isBefore(day) && entry.key.end.isAfter(day))
              .expand((entry) => entry.value)
              .toList();
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
        ),
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isNotEmpty) {
              return agendaMarkCircle();
            }
            return null; // Return null for days with no events
          },

        ),

      ),
    );
  }


}
