

import 'package:bs_educativo/model/response/cupon/Coupon.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';

class SelectedCouponTypeView extends StatefulWidget {
  final Function(int) onScreenChange;
  final List<Cupon>? couponList;
  SelectedCouponTypeView({this.couponList, super.key, required this.onScreenChange});

  @override
  State<SelectedCouponTypeView> createState() => _SelectedCouponTypeViewState();
}

class _SelectedCouponTypeViewState extends State<SelectedCouponTypeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        //padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
        decoration: deco(),
        child: Column(
          children: [
            titleCard("Electrónica"),
            gapH(10.h),
            Expanded(
              child:
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
                  itemCount:(widget.couponList ?? []).length,

                  itemBuilder: (context, index) {
                    final rec = widget.couponList![index];
                    return GestureDetector(onTap: (){
                    },
                      child:
                           Column(
                             children: [
                               Image.network(rec.cupon ?? ""),
                               const SizedBox(height: 5,)
                             ],
                           )
                    );
                  }
              ),
              // SingleChildScrollView(
              //     padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              //     child:
              //     Column(children: [
              //
              //       couponCard(
              //           percent: "50%",
              //           title: 'Electrónica Japonesa', date: 'de Aug 8 al oct  31 2024.',
              //           color: Color(0xFF950707),
              //         gradientColor:[
              //         Color(0xFF950707),
              //         Color(0xFF2F0202)
              //        ], onTap: () { widget.onScreenChange(2); },
              //       ),
              //       couponCard(
              //         percent: "30%",
              //         title: 'Cupón de prueba', date: 'de Aug 8 al oct  31 2024.',
              //         color: Color(0xFFFF5900),
              //         gradientColor:[
              //           Color(0xFFFF5900),
              //           Color(0xFF993500)
              //         ],
              //         onTap: () { widget.onScreenChange(2); },
              //       ),
              //       couponCard(
              //         percent: "20%",
              //         title: 'Cupón de prueba', date: 'de Aug 8 al oct  31 2024.',
              //         color: Color(0xFF073095),
              //         gradientColor:[
              //           Color(0xFF073095),
              //           Color(0xFF020F2F)
              //         ],
              //         onTap: () { widget.onScreenChange(2); },
              //       ),
              //     ],)
              // ),
            ),
          ],
        ));
  }

  SizedBox couponCard({required String percent, required String title, required String date,
    required Color color,required List<Color> gradientColor,required Function() onTap}) {
    return SizedBox(
                    child: GestureDetector(onTap: onTap,
                      child: Stack(
                        children: [
                          Image.asset(AppAssets.blade,
                            width: 360.w, height: 150.h,fit: BoxFit.fitWidth,),
                          Positioned(
                            left: 0.w,
                            top: 20.h,
                            child: Row(
                              children: [
                                gapW(40.w),
                                rotateOutlineText(text:percent,colors: color),
                                gapW(40.w),
                                Container(
                                  width: 190.w,height: 78.h,
                                  padding: EdgeInsets.symmetric(vertical: 7.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      begin:Alignment.topCenter ,
                                      end: Alignment.bottomCenter,
                                      colors: gradientColor,
                                    )
                                  ),
                                  child: Column(children: [
                                    txtB(title,13.sp,weight: FontWeight.w800,color: Colors.white,
                                        textAlign: TextAlign.center),
                                    const Spacer(),
                                    SizedBox(
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          txtB("Válido: ", 10.sp,color: Colors.white),
                                          txtR(date, 10.sp,color: Colors.white,textAlign: TextAlign.left),
                                        ],
                                      ),
                                    )
                                  ],),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }

  RotatedBox rotateOutlineText({required String text,required Color colors}) {
    return RotatedBox(
                    quarterTurns: 3,
                    child: StrokeText(
                      text: text,
                      textStyle: GoogleFonts.inter(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white
                      ),
                      strokeColor: colors,
                      strokeWidth: 3.r,
                    ),
                  );
  }
}
