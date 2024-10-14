import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utility/demoInfos.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';

class SelectedCouponDetailsView extends StatefulWidget {
  final Function(int) onScreenChange;
  const SelectedCouponDetailsView({super.key, required this.onScreenChange});

  @override
  State<SelectedCouponDetailsView> createState() => _SelectedCouponDetailsViewState();
}

class _SelectedCouponDetailsViewState extends State<SelectedCouponDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        //padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
        decoration: deco(),
        child: Column(
          children: [
            titleCard("Electrónica Japonesa"),
            gapH(10.h),
            Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  child:
                  Column(children: [
                    QrImageView(data: qrData, size: 240.h,),
                    gapH(20.h),
                    txtB("QR7781KLP",20.sp),
                    gapH(40.h),
                    rowText(title: "50%: ", desc: "En partes de celular"),
                    gapH(10.h),
                    rowText(title: "Válido: ", desc: "del 8 de agosto al 31 de octubre")




                  ],)
              ),
            ),
          ],
        ));
  }

  Row rowText({required String title, required String desc}) {
    return Row(children: [
                    txtR(title, 15.sp,weight: FontWeight.w600),
                    SizedBox(width: 200.w,
                        child: txtR(desc, 15.sp,weight: FontWeight.w400,textAlign: TextAlign.left)),
                  ],);
  }
}
