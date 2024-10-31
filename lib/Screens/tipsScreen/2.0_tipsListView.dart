import 'package:bs_educativo/cubit/Tips/tips_cubit.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/tips/tips.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class TipListView extends StatefulWidget {
  final Function(int, {TipResponse? tips}) onScreenChange;
  const TipListView({super.key, required this.onScreenChange});

  @override
  State<TipListView> createState() => _TipListViewState();
}

class _TipListViewState extends State<TipListView> {
  late TipsCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      cubit.getTips(GeneralRequest(idColegio: AppConstant.userLoginResponse?.idColegio));
    });
  }
  @override
  Widget build(BuildContext context) {
    cubit = context.read();
    return BlocBuilder<TipsCubit, TipsState>(
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is TipsLoadingState,
          child: Container(
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
                  txtR("Tip",15.sp,weight: FontWeight.w600),
                  const Spacer(),
                  txtR("Fecha",15.sp,weight: FontWeight.w600),
                ]),
              ),
              gapH(10.h),
              Expanded(
                child:
                ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
                    itemCount:cubit.tips.length,
                    itemBuilder: (context, index) {
                      final doc = cubit.tips[index];
                      return GestureDetector(onTap: (){
                        widget.onScreenChange(1, tips: doc);
                      },
                        child: documentAndDates(
                            title:doc.titulo??"",
                            date:  AppUtils.getDate(doc.fechaFin.toString().toString(), "yyyy-MM-dd")),
                      );
                    }
                ),
              ),

            ],),
          ),
        );
      },
    );
  }
}
