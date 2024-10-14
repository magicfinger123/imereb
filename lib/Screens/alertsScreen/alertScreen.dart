import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';


class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
        body: MenuDesign(
          institution: "Colegio Internacional de Panamá",
          selectedUser: selectedUser, group: group, counselor: counselor,
          selectUserTap: () {  },
          container:
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: deco(),
                  child: Column(children: [
                    heading(),
                    gapH(10.h),
                    SizedBox(height: 510.h,
                      child:
                      ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
                          itemCount:disciplinaryRecords.length,
                          itemBuilder: (context, index) {
                            final rec = disciplinaryRecords?[index];
                            return GestureDetector(onTap: (){

                            },
                              child: alertWidget(title:rec?.description??"",
                                  amount:rec?.date.toString()??"",
                                  onIconTap: () {

                                  }),
                            );
                          }
                      ),
                    ),

                  ],),
                ),
                gapH(10.h),
                backAndIcon((){
                  Navigator.pop(context);
                },
                        ()
                    {

                    },
                    null,size: 61.0),
              ],
            ),
          ),
        ));
  }


  Container heading() {
    return Container(width: double.infinity,height: 65.h,
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
        txtR("Alerta",15.sp,weight: FontWeight.w600),
        Spacer(),
        txtR("Fecha",15.sp,weight: FontWeight.w600),
      ]),
    );
  }
  BoxDecoration deco() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.blueBa,width: 2.5.r)
    );
  }
}
