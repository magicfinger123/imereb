import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class AgendaCalendarView extends StatefulWidget {
  final Function(int) onScreenChange;
  const AgendaCalendarView({super.key, required this.onScreenChange});

  @override
  State<AgendaCalendarView> createState() => _AgendaCalendarViewState();
}

class _AgendaCalendarViewState extends State<AgendaCalendarView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? normalizedSelectedDay;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: deco(),
      child: Column(children: [
        titleCard("Agenda"),
        gapH(10.h),
        Container(height: 480.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: deco2(),
          child: Column(
            children: [
              TableCalendar(
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
                     widget.onScreenChange(1);
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
            ],
          ),
          ),


      ],),
    );
  }


}
Container titleCard(title) {
  return Container(width: double.infinity,height: 65.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
    decoration: BoxDecoration(
        color: AppColors.bgDc,
        borderRadius: BorderRadius.circular(6.r),
        border: Border(bottom: BorderSide(color: AppColors.border,width: 1.5.r)),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 5))
        ]
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          txtB(title,20.sp,),
        ]),
  );
}
Container titleCard2(title,date) {
  return Container(width: double.infinity,height: 70.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 3.h),
    decoration: BoxDecoration(
        color: AppColors.bgDc,
        borderRadius: BorderRadius.circular(6.r),
        border: Border(bottom: BorderSide(color: AppColors.border,width: 1.5.r)),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 5))
        ]
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              txtB(title,19.sp,),
              txtR(date,15.sp,weight: FontWeight.w300),
            ],
          ),
        ]),
  );
}

Container agendaMarkCircle() {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    width: 40.w,
    height: 40.w,
    decoration: BoxDecoration(
      border: Border.all(
          color: AppColors.blueBa,
          width: 1.r// Marker border color
      ),
      color: AppColors.blueBa.withOpacity(0.20), // Marker color
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    // child: Text(
    //   date.day.toString(),
    //   style: const TextStyle(
    //     color: Colors.black, // Text color for days with events
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );
}

BoxDecoration deco2() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(28.r),
    color: const Color(0xFFE8E8E8),
  );
}

BoxDecoration deco() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(6.r),
      color: AppColors.white,
      border: Border.all(color: AppColors.blueBa,width: 2.5.r)
  );
}

