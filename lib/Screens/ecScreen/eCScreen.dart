import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';


class EcScreen extends StatefulWidget {
  const EcScreen({super.key});

  @override
  State<EcScreen> createState() => _EcScreenState();
}

class _EcScreenState extends State<EcScreen> {
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
                          itemCount:financialEntries.length,
                          itemBuilder: (context, index) {
                            final fin = financialEntries?[index];
                            return GestureDetector(onTap: (){

                            },
                              child: finEcWidget(title: fin?.description??"",
                                  amount:fin?.amount.toString()??"0.0",isCredit: false,
                                  onIconTap: () {  }),
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
                    AppAssets.share,size: 61.0),
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
                      txtR("Concepto",15.sp,weight: FontWeight.w600),
                      Spacer(),
                      txtR("Monto",15.sp,weight: FontWeight.w600),
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
