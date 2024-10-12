import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';

class MainRatingsView extends StatefulWidget {
  final Function(int) onScreenChange;
  const MainRatingsView({super.key, required this.onScreenChange});

  @override
  State<MainRatingsView> createState() => _MainRatingsViewState();
}

class _MainRatingsViewState extends State<MainRatingsView> {
  List<Subjects> subjectsItem = [
    Subjects(name: 'Español', grade: "4.9"),
    Subjects(name: 'Matemáticas', grade: "4.8"),
    Subjects(name: 'Inglés', grade: "4.8"),
    Subjects(name: 'Ciencias', grade: "4.9"),
    Subjects(name: 'Educación Física', grade: "5.0"),
    Subjects(name: 'Estudios Sociales', grade: "4.9"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
          border: Border.all(color: AppColors.blueBa,width: 2.5.r)
      ),
      child: Column(children: [
        Container(width: double.infinity,height: 65.h,
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
          child: Row(children: [
            txtR("Materia",15.sp,weight: FontWeight.w600),
            Spacer(),
            txtR("Promedio",15.sp,weight: FontWeight.w600),
          ]),
        ),
        gapH(10.h),
        Expanded(
          child:
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
              itemCount:subjectsItem.length,
              itemBuilder: (context, index) {
                final sub= subjectsItem?[index];
                return GestureDetector(
                  child: subjectAndRatingItemWidget(
                      subject:sub?.name??"",
                      rating: sub?.grade.toString()??""),
                );
              }
          ),
        ),

      ],),
    );
  }

  Widget subjectAndRatingItemWidget({required String subject, required String rating}) {
    return Column(children: [
        Row(children: [
          Expanded(child:
          txtR(subject,15.sp,weight: FontWeight.w600)),
          gapW(20.w),
          txtB(rating,15.sp,weight: FontWeight.w500,color:Colors.green,textAlign: TextAlign.left),
        ],),
        gapH(10.h),
        Divider(color: AppColors.black.withOpacity(0.25),thickness: 1.25,),
      ],);
  }
}
