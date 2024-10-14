import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/colors.dart';
import '../../utility/widgets.dart';


class ComposeMessageView extends StatefulWidget {
  final Function(int) onScreenChange;
  const ComposeMessageView({super.key, required this.onScreenChange});

  @override
  State<ComposeMessageView> createState() => _ComposeMessageViewState();
}

class _ComposeMessageViewState extends State<ComposeMessageView> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(6.r),
    color: AppColors.white,
    border: Border.all(color: AppColors.border,width: 2.5.r)
    ),
      child:SingleChildScrollView(
        child: Column(children: [
          Container(
           padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(6.r),
             color: AppColors.white,
             border: Border(bottom: BorderSide(color: AppColors.border,width: 1.5.r)),
             boxShadow: [
               BoxShadow(color: AppColors.black.withOpacity(0.25),
                   spreadRadius: 0,
                   blurRadius: 5,
                   offset: Offset(0, 5))
             ]
           ),
           child: Column(children: [
             gapH(10.h),
             SizedBox(width: double.infinity,height: 30.h,
               child: TextField(
                   controller: descriptionController,
                   style: GoogleFonts.inter(
                     color: AppColors.txt1,
                     fontSize: 12.sp,
                     fontWeight: FontWeight.w500,
                   ),
                   cursorHeight: 10.h,
                   cursorColor: AppColors.blueBa,
                   decoration: InputDecoration(
                     fillColor: AppColors.white,
                     filled: true,
                     hintText: "título",
                     hintStyle: GoogleFonts.inter(
                       color: AppColors.txt1,
                       fontSize: 10.sp,
                       fontWeight: FontWeight.w400,
                     ),
                     contentPadding: EdgeInsets.only(bottom: 0,top: 0,left: 12.w,right: 10.w),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(6.r),
                       borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(6.r),
                       borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(6.r),
                       borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                     ),
                   )
               ),
             ),
             gapH(10.h),
             threeOptionWidget(
                 title: "Para: ", content: "Marisol Montenegro",
                 onTap: (){}
             ),
             gapH(3.h),
             threeOptionWidget(
                 title: "CC: ", content: "Marisol Montenegro",
                 onTap: (){}
             ),
             gapH(3.h),
             threeOptionWidget(
                 title: "CC0: ", content: "Marisol Montenegro",
                 onTap: (){}
             ),
           ],),
         ),
          gapH(3.h),
          Container(
            width: double.infinity,
            height: 370.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.bgDc,
            ),
            child: TextField(
              controller: msgController,
              maxLines: null,
              style: GoogleFonts.inter(
                color: AppColors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              cursorHeight: 14.h,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5.h,top: 5.h,left: 5.w,right: 5.w),
                border: InputBorder.none,
                hintMaxLines: null,
                hintText: "Escribir Mensaje",
                hintStyle: GoogleFonts.inter(
                  color: AppColors.txt1,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          gapH(3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Image.asset(AppAssets.attach,width: 29.w,height: 29.h,fit: BoxFit.contain,),
                gapW(1.w),
                GestureDetector(onTap: (){},
                    child: SizedBox(child: txtB("Cargar archivo adjunto",13.sp,textAlign: TextAlign.left))),
              ],
            ),
          ),
          gapH(10.h),


        ],)
      ),
    );
  }

  Row threeOptionWidget({required String title,required String content,required Function() onTap}) {
    return Row(children: [
          txtB(title,15.sp),
          Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: txtR(content,15.sp,weight: FontWeight.w500,textAlign: TextAlign.left))),
          gapW(20.w),
          GestureDetector(onTap: onTap,
              child: Image.asset(AppAssets.plus,width: 30.h,height: 30.h,fit: BoxFit.contain,)),
        ],);
  }
}
