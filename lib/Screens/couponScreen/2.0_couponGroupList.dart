import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';


class CouponGroupListView extends StatefulWidget {
  final Function(int) onScreenChange;
  const CouponGroupListView({super.key, required this.onScreenChange});

  @override
  State<CouponGroupListView> createState() => _CouponGroupListViewState();
}

class _CouponGroupListViewState extends State<CouponGroupListView> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 600.h,
        width: double.infinity,
        //padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
    decoration: deco(),
    child: Column(
      children: [
        titleCard("Cupones"),
        gapH(10.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child:
          Column(children: [
            gapH(30.h),
            Row(
              children: [
                menuListItem("Viajes", AppAssets.trips, (){
                  widget.onScreenChange(1);
                }),
                const Spacer(),
                menuListItem("Electrónica", AppAssets.speaker,(){widget.onScreenChange(1);}),
              ],
            ),
            gapH(30.h),
            Row(
              children: [
                menuListItem("Hogar", AppAssets.homeTwo,(){widget.onScreenChange(1);}),
                const Spacer(),
                menuListItem("Joyería", AppAssets.watch,(){widget.onScreenChange(1);}),
              ],
            ),
            gapH(30.h),
            Row(
              children: [
                menuListItem("Ropa", AppAssets.bag,(){widget.onScreenChange(1);}),
                const Spacer(),

              ],
            ),
            gapH(30.h),

          ],)),
        ),
      ],
    ));
  }

}
