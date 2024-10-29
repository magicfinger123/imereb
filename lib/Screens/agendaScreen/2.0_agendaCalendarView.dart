import 'package:bs_educativo/cubit/Agenda/agenda_cubit.dart';
import 'package:bs_educativo/model/request/AgendaDetailRequest.dart';
import 'package:bs_educativo/model/request/AgendaListRequest.dart';
import 'package:bs_educativo/model/response/agenda/AgendaDetailItem.dart';
import 'package:bs_educativo/model/response/agenda/AgendaItem.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class AgendaCalendarView extends StatefulWidget {
  final Function(int, {List<AgentDetailItem> agendaDetails}) onScreenChange;
  const AgendaCalendarView({super.key, required this.onScreenChange});

  @override
  State<AgendaCalendarView> createState() => _AgendaCalendarViewState();
}

class _AgendaCalendarViewState extends State<AgendaCalendarView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? normalizedSelectedDay;
  late AgendaCubit cubit;
  List<AgendaItem> agendaItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit = context.read<AgendaCubit>();
      cubit.fetchAgendaList(AgendaListRequest(
        idcolegio: (AppConstant.userLoginResponse!.idColegio!).toString(),
        cedula: AppConstant.userLoginResponse!.cedula!,
        ano: DateTime.now().year.toString(),
        bimestre: '1',
        fechaI: DateTime(DateTime.now().year, 01, 01),
        fechaF: DateTime.now(), //AppConstant.userLoginResponse?.tipoMaestro ?? ""
      )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaCubit, AgendaState>(
      builder: (context, state) {
        if (state is AgendaItemsState){
          agendaItems = state.agendas;
        }
        if (state is AgendaDetailState){
           var  agendaDetailItems = state.agendas;

           WidgetsBinding.instance.addPostFrameCallback((_){
             Future.delayed(Duration.zero,(){
               widget.onScreenChange(1, agendaDetails: agendaDetailItems);
               cubit.resetState();
             });
           });
        }
        return LoadingOverlay(
          isLoading: state is AgendaLoadingState,
          child: Container(
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
                        if(normalizedSelectedDay!=null){
                          List<DateTime> agendaIte  = agendaItems.where((item) =>
                          DateTime(selectedDay.year, selectedDay.month, selectedDay.day) == DateTime(item.fecha!.year, item.fecha!.month, item.fecha!.day))
                              .expand((toElements) => [DateTime(toElements.fecha!.year, toElements.fecha!.month, toElements.fecha!.day)]).toList();
                          if (agendaIte.isNotEmpty) {
                            print("Agenda found for $normalizedSelectedDay");
                          //  widget.onScreenChange(1);
                            cubit.fetchAgendaDetailItem(AgendaDetailRequest(
                                idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(),
                                cedula: AppConstant.userLoginResponse!.cedula!,
                                ano: normalizedSelectedDay!.year.toString(), currentDate: normalizedSelectedDay!));
                          } else {
                            print("No agenda found for $normalizedSelectedDay");
                          }
                        }
                      },
                      calendarStyle: const CalendarStyle(
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
                        return agendaItems.where((item) => DateTime(day.year, day.month, day.day) == DateTime(item.fecha!.year, item.fecha!.month, item.fecha!.day))
                            .expand((toElements) => [DateTime(toElements.fecha!.year, toElements.fecha!.month, toElements.fecha!.day)]).toList();
                      },
                      headerStyle: const HeaderStyle(
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
          ),
        );
      },
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

