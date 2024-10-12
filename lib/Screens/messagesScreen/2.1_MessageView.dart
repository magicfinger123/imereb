

import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';


class MessageView extends StatefulWidget {
  final Function(int) onScreenChange;
  const MessageView({super.key, required this.onScreenChange});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.border,width: 2.5.r)
    ),
      child: SingleChildScrollView(
        child: messageViewWidget(
            title: "title",
            sender: "sender",
            toAddresses: "toAddresses",
            copiedAddresses: "copiedAddresses",
            message: demoText,
            fileTitle: "",
            replyAllTap: (){},
            replyLeftTap: (){},
            replyRightTap: (){},
            fileTap: (){},
        ),
      ),
    );
  }

  Column messageViewWidget({
    required String title,
    required String sender,
    required String toAddresses,
    required String copiedAddresses,
    required String message,
    required String fileTitle,
    required Function()replyAllTap,
    required Function()replyLeftTap,
    required Function()replyRightTap,
    required Function()fileTap,

}) {
    return Column(
        children: [
          Row(
            children: [
              SizedBox(width: 220.w,
                child: txtR(title,15.sp,weight: FontWeight.w600,textAlign: TextAlign.left),),
              const Spacer(),
              GestureDetector(onTap: replyAllTap,
                  child: Image.asset(AppAssets.replyAll,width: 31.w,height: 25.h,fit: BoxFit.cover,)),
              gapW(20.h),
              GestureDetector(onTap: replyLeftTap,
                  child: Image.asset(AppAssets.replyLeft,width: 25.w,height: 25.h,fit: BoxFit.cover,)),
              gapW(20.h),
              GestureDetector(onTap: replyRightTap,
                  child: Image.asset(AppAssets.replyRight,width: 25.w,height: 25.h,fit: BoxFit.cover,)),

            ],
          ),
          gapH(16.h),
          Row(
            children: [
              Image.asset(AppAssets.profile,width: 18.w,height: 18.h,fit: BoxFit.contain,),
              gapW(10.h),
              Expanded(child: txtB(sender,13.sp,textAlign: TextAlign.left)),
            ],
          ),
          gapH(14.h),
          Row(children: [
            txtB("Para: ",15.sp,textAlign: TextAlign.left),
            Expanded(child: txtR(toAddresses,15.sp,textAlign: TextAlign.left)),
          ],),
          gapH(10.h),
          Row(children: [
            txtB("CC: ",15.sp,textAlign: TextAlign.left),
            Expanded(child: txtR(copiedAddresses,15.sp,textAlign: TextAlign.left)),
          ],),
          gapH(15.h),
          Container(width: double.infinity,height: 350.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.bgDc,
              border: Border.all(color: AppColors.txt1,width: 1.5.r)
            ),
              child: SingleChildScrollView(
                  child: txtR(message,15.sp,
                      textAlign: TextAlign.left,color: AppColors.black,
                      maxLines: 1000000000000000000))),
          gapH(10.h),
          Row(
            children: [
              Image.asset(AppAssets.attach,width: 29.w,height: 29.h,fit: BoxFit.contain,),
              gapW(1.w),
              GestureDetector(onTap: fileTap,
                  child: Expanded(child: txtB(fileTitle,13.sp,textAlign: TextAlign.left))),
            ],
          ),
          gapH(2.h),



      ]
    );
  }
}
