import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';

class TipsDetailsView extends StatefulWidget {
  final Function(int) onScreenChange;
  const TipsDetailsView({super.key, required this.onScreenChange});

  @override
  State<TipsDetailsView> createState() => _TipsDetailsViewState();
}

class _TipsDetailsViewState extends State<TipsDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: deco(),
      child: Column(children: [
        titleCard("Utiliza 100% el APP"),
        gapH(10.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: txtR("Utiliza El APP",15.sp,
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

