import 'package:bs_educativo/utility/demoInfos.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';



class DocumentDetailsScreen extends StatefulWidget {
  final Function(int) onScreenChange;
  const DocumentDetailsScreen({super.key, required this.onScreenChange});

  @override
  State<DocumentDetailsScreen> createState() => _DocumentDetailsScreenState();
}

class _DocumentDetailsScreenState extends State<DocumentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: deco(),
      child: Column(children: [
        titleCard("Manual de Disciplina"),
        gapH(10.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: txtR("Manual de Disciplina",15.sp,
                      weight: FontWeight.w600,textAlign: TextAlign.left),
                ),
                gapH(20.h),
                txtR(demoText,15.sp,
                    weight: FontWeight.w400,textAlign: TextAlign.left,
                    maxLines: 9000000000000000000),

              ],
            ),
          ),
        ),


      ],),
    );
  }
}
