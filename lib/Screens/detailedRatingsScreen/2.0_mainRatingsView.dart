import 'package:bs_educativo/cubit/Notes/note_cubit.dart';
import 'package:bs_educativo/model/request/NotasDetailer.dart';
import 'package:bs_educativo/model/response/note/Boletin.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../model/response/note/Notas.dart';
import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';

class MainRatingsView extends StatefulWidget {
  final Function(int,  {Boletin? selectedNote}) onScreenChange;
  const MainRatingsView({super.key, required this.onScreenChange});

  @override
  State<MainRatingsView> createState() => _MainRatingsViewState();
}

class _MainRatingsViewState extends State<MainRatingsView> {

  late NoteCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      cubit.getBoletins(
          NotasDetailerRequest(
          ano: DateTime.now().year,
          bimestre: AppConstant.userLoginResponse?.periodoPre,
          idColegio: AppConstant.userLoginResponse?.idColegio,
          idioma: 1,
          cedula: AppConstant.userLoginResponse?.cedula
      )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    cubit = context.read<NoteCubit>();
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return LoadingOverlay(
          isLoading:  state is NoteLoadingState,
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
                    itemCount:cubit.boletins.length,
                    itemBuilder: (context, index) {
                      final sub= cubit.boletins[index];
                      return GestureDetector(onTap: (){
                        widget.onScreenChange(1, selectedNote: sub);
                      },
                        child: subjectAndRatingItemWidget(
                            subject:sub.nommat??"",
                            rating: sub.getPromedio((AppConstant.userLoginResponse?.periodoPre ?? "").toString())),
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
