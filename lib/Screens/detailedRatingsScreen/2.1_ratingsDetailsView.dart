import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class RatingsDetailView extends StatefulWidget {
  final Function(int) onScreenChange;
  const RatingsDetailView({super.key, required this.onScreenChange});

  @override
  State<RatingsDetailView> createState() => _RatingsDetailViewState();
}

class _RatingsDetailViewState extends State<RatingsDetailView> {
  List<SubjectsRating> SubjectsActivities = [
    SubjectsRating(name: 'Ejercicio 1', grade: "4.9"),
    SubjectsRating(name: 'Charla 1', grade:"4.8"),
    SubjectsRating(name: 'Album 1', grade: "4.8"),
    SubjectsRating(name: 'Ejercicio 2', grade: "4.9"),
    SubjectsRating(name: 'Ejercicio 3', grade: "5.0"),
    SubjectsRating(name: 'Album 2', grade: "4.9"),
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
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 3.h),
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
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txtR("Materia:",15.sp,weight: FontWeight.w600),
                txtR("Item",13.sp,weight: FontWeight.w600),
              ],
            ),
            const Spacer(),
            txtR("Promedio",15.sp,weight: FontWeight.w600),
          ]),
        ),
        gapH(10.h),
        Expanded(
          child:
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
              itemCount:SubjectsActivities.length,
              itemBuilder: (context, index) {
                final act= SubjectsActivities?[index];
                return GestureDetector(
                  child: subjectAndRatingItemWidget(
                      subject:act?.name??"",
                      rating: act?.grade.toString()??""),
                );
              }
          ),
        ),

      ],),
    );
  }
}
