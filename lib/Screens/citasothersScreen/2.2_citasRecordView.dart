import 'package:bs_educativo/utility/demoInfos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';

import '../../utility/colors.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class CitasRecordView extends StatefulWidget {
  final Function(int) onScreenChange;
  const CitasRecordView({super.key, required this.onScreenChange});

  @override
  State<CitasRecordView> createState() => _CitasRecordViewState();
}

class _CitasRecordViewState extends State<CitasRecordView> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          itemCount: usersStatusList.length,
          itemBuilder: (context, index) {
            final user = usersStatusList[index];

            return GestureDetector(
              onTap: () {
              // showPopover(
              //     context: context,
              //     bodyBuilder: (context) =>
              //         commentPopWidget(
              //             title: "title",
              //             date: "date",
              //             comment: "comment"
              //         ),
              //
              //     // onPop: () => print('Popover was popped!'),
              //     direction: PopoverDirection.left,
              //     width: 254.w,
              //     height: 170.h,
              //     arrowHeight: 10.h,
              //     arrowWidth: 12.w,
              //     radius: 20.r,
              //     barrierColor: Colors.transparent,
              // );
            },
            child: statusWidget(
                title: user.name,
                date: user.date,
                color: user.status ==Status.Accepted ? Color(0xFF92AE79) :
                user.status == Status.Pending ? Color(0xFFFFFF00): Color(0xFF950707).withOpacity(0.47)
            ),
          );
        }
      ),
    );
  }

  Container statusWidget({required String title, required String date,required Color color}) {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SizedBox(width: 140.w,
              child: txtR(title,15.sp,weight: FontWeight.w600)),
          SizedBox(width: 130.w,
              child: txtR(date,15.sp,weight: FontWeight.w400)),
          Container(
            width: 20.w,height: 20.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blueBa,width: 1.5.r),
              shape: BoxShape.circle
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle
              ),
            ),
          )


        ],),
        gapH(10.h),
        Divider()
      ],
    ),
  );
  }
}
