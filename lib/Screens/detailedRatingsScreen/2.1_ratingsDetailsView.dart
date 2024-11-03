import 'package:bs_educativo/cubit/Notes/note_cubit.dart';
import 'package:bs_educativo/model/request/NotasDetailer.dart';
import 'package:bs_educativo/model/response/note/Notas.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_lifecycle/flutter_page_lifecycle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../model/response/note/Boletin.dart';
import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class RatingsDetailView extends StatefulWidget {
  final Function(int) onScreenChange;
  Boletin? note;
  RatingsDetailView({super.key, required this.onScreenChange, this.note});

  @override
  State<RatingsDetailView> createState() => _RatingsDetailViewState();
}

class _RatingsDetailViewState extends State<RatingsDetailView> {
  late NoteCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = context.read<NoteCubit>();
    return BlocBuilder<NoteCubit, NoteState>(
  builder: (context, state) {
    return LoadingOverlay(
      isLoading: state is NoteLoadingState,
      child: PageLifecycle(
        stateChanged: (bool appeared) {
          if (appeared){
            if (widget.note != null) {
              cubit.getNoteDetails(
                  NotasDetailerRequest(
                      ano: DateTime
                          .now()
                          .year,
                      bimestre: AppConstant.userLoginResponse?.periodoPre,
                      idColegio: AppConstant.userLoginResponse?.idColegio,
                      idioma: 1,
                      cedula: AppConstant.userLoginResponse?.cedula,
                      codmat: widget.note?.codmat
                  )
              );
            }
          }
        },
        child: Container(
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
                  itemCount:cubit.noteDetails.length,
                  itemBuilder: (context, index) {
                    final act= cubit.noteDetails[index];
                    return GestureDetector(
                      child: subjectAndRatingItemWidget(
                          subject:act.item??"",
                          rating: act.calificacion.toString().toString()??""),
                    );
                  }
              ),
            ),

          ],),
        ),
      ),
    );
  },
);
  }
}
