import 'package:bs_educativo/model/response/agenda/AgendaDetailItem.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/widgets.dart';
import '2.0_agendaCalendarView.dart';


class AgendaDetailsView extends StatefulWidget {
  final Function(int) onScreenChange;
  final List<AgentDetailItem>? agendaDetails;
  const AgendaDetailsView({super.key, required this.onScreenChange,  this.agendaDetails});

  @override
  State<AgendaDetailsView> createState() => _AgendaDetailsViewState();
}

class _AgendaDetailsViewState extends State<AgendaDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: deco(),
      child: Column(children: [
        titleCard2("Agenda","Del:    al:    "),
        gapH(10.h),
        Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(children: agendas()
              ,),
          ),
        ))
      ],),
    );
  }

   List<Widget> agendas(){
     List<Widget> returnValue = [];
    widget.agendaDetails?.forEach((element){
      returnValue.add(
          Column(
        children: [
          rowText(
              title1: "Fecha: ",value1: element.fecha.toString(),
              title2: "Materia: ",value2: "Ejercicio 1"),
          gapH(10.sp),
          rowText(
              title1: "Tema: ",value1: element.actualizado ?? "",
              title2: "Actualizada: ",value2: element.actualizado ?? ""),
          gapH(10.sp),
          rowText2(title1: "Profesor: ",value1: element.nombre ?? ""),
          gapH(10.sp),
          rowText2(title1: "Contenido:  ",value1: ""),
          gapH(5.sp),
          Container(width: double.infinity,
              child: txtR(element.contenido,15.sp,weight: FontWeight.w400,textAlign: TextAlign.start)),
          Divider()
        ],
      ));
    });
    return returnValue;
  }

  Row rowText({required String title1,required String value1,
    required String title2,required String value2}) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(children: [
            txtR(title1,15.sp,weight: FontWeight.w600),
            SizedBox(width: 100.w,
                child: txtR(value1,14.sp,weight: FontWeight.w400,textAlign: TextAlign.left)),
          ],),
          gapW(10.w),

          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            txtR(title2,15.sp,weight: FontWeight.w600),
            SizedBox(
                width: 100.w,child: txtR(value2,14.sp,weight: FontWeight.w400,textAlign: TextAlign.left)),
          ],),
        ],);
  }
  Row rowText2({required String title1,required String value1}) {
    return Row(children: [
      txtR(title1,15.sp,weight: FontWeight.w600),
      SizedBox(width: 220.w,
          child: txtR(value1,15.sp,weight: FontWeight.w400,textAlign: TextAlign.left)),
    ]);
  }

}
