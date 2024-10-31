import 'package:bs_educativo/model/response/tips/tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';

class TipsDetailsView extends StatefulWidget {
  final Function(int) onScreenChange;
  final TipResponse? tipResponse;
  const TipsDetailsView({super.key, required this.onScreenChange, required this.tipResponse});

  @override
  State<TipsDetailsView> createState() => _TipsDetailsViewState();
}

class _TipsDetailsViewState extends State<TipsDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: deco(),
      child: Column(children: [
        titleCard(widget.tipResponse?.titulo ?? ""),
        gapH(10.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: txtR(widget.tipResponse?.titulo ?? "",15.sp,
                      weight: FontWeight.w600,textAlign: TextAlign.left),
                ),
                gapH(20.h),
                txtR(widget.tipResponse?.contenido ?? "",15.sp,
                    weight: FontWeight.w400,textAlign: TextAlign.left,
                    maxLines: 9000000000000000000),
                Image.network(widget.tipResponse?.imgDir ?? "")

              ],
            ),
          ),
        ),


      ],),
    );
  }
}

