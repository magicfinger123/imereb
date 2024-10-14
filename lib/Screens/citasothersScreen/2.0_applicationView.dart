
import 'package:bs_educativo/utility/colors.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/demoInfos.dart';



class ApplicationView extends StatefulWidget {
  final Function(int) onScreenChange;
  const ApplicationView({super.key, required this.onScreenChange});

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(children: [
          gapH(20.h),
          reToWidget(recipientName: '', addTap: () {
            showUserSelectionDialog(context, categories);
          }, refreshTap: () {  }),
          gapH(30.h),
          Align(alignment: Alignment.centerLeft,
              child: txtR("Comentarios",15.sp)),
          gapH(15.h),
          requestInputField(controller,),
          gapH(20.h),
          Row(children: [
            smallBtn(title: "Cancelar",onTap: (){

            }),
            const Spacer(),
            smallBtn(title: "Solicitar",onTap: (){

            }),
          ],),
          gapH(20.h),



        ],),
      ),
    );
  }
  void showUserSelectionDialog(BuildContext context, List<Category> categories) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.only(bottom: 100.h,left: 0,right: 0),
          alignment: Alignment.bottomCenter,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.35.r),
              side: BorderSide(color: AppColors.txt1, width: 3.5.r)
          ),
          elevation: 1.0,
          child: Container(
            height: 500.h,
            width: 358.w,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.35.r),
              color: AppColors.white,
              border: Border.all(color: AppColors.txt1, width: 3.5.r),
            ),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  GestureDetector(
                      onTap: () { Navigator.pop(context); },
                      child: Image.asset(AppAssets.close,width: 30.w,height: 30.h,))

                ],),
                gapH(10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CollapsibleCategoryWidget(
                        category: categories[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }







}
