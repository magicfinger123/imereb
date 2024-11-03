import 'package:bs_educativo/ApiService/api_url.dart';
import 'package:bs_educativo/cubit/meet/meet_cubit.dart';
import 'package:bs_educativo/model/request/CitaRequest.dart';
import 'package:bs_educativo/model/request/MeetRequest.dart';
import 'package:bs_educativo/model/response/meet/MeetEliglibleList.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:bs_educativo/utility/colors.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ApplicationView extends StatefulWidget {
  final Function(int) onScreenChange;

  const ApplicationView({super.key, required this.onScreenChange});

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  late MeetCubit cubit;
  TextEditingController controller = TextEditingController();
  MeetEliglibleList? selectedItem;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      cubit.fetchMeetEligibleList(MeetRequest(idxEstudiante: AppConstant.selectedMember?.idxEstudiante ?? 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read<MeetCubit>();
    return BlocBuilder<MeetCubit, MeetState>(
      builder: (context, state) {
        if (state is MeetRequestSubmittedState){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppUtils.showSuccessSnack("Solicitud enviada exitosamente", context);
            cubit.resetState();
          });
        }
        return LoadingOverlay(
          isLoading: state is MeetLoadingState,
          child: Container(padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(children: [
                gapH(20.h),
                reToWidget(recipientName: selectedItem != null ? (selectedItem?.nombre ?? "") : '', addTap: () {
                  showUserSelectionDialog(context, cubit.eligibleList);
                }, refreshTap: () {}),
                gapH(30.h),
                Align(alignment: Alignment.centerLeft,
                    child: txtR("Comentarios", 15.sp)),
                gapH(15.h),
                requestInputField(controller,),
                gapH(20.h),
                Row(children: [
                  smallBtn(title: "Cancelar", onTap: () {
                    setState(() {
                      selectedItem = null;
                      controller.text = "";
                    });
                  }),
                  const Spacer(),
                  smallBtn(title: "Solicitar", onTap: () {
                    if (controller.text.isNotEmpty && selectedItem != null){
                      RequestAppointment request = RequestAppointment(idxCita: AppConstant.selectedMember?.idxEstudiante ?? 0,
                          idxMaestro: (selectedItem?.idxMaestro ?? 0).toInt(),
                          fecha: DateTime.now().toString(),
                          hora: DateTime.now().hour,
                          minutos: DateTime.now().minute,
                          idColegio: AppConstant.userLoginResponse?.idColegio ?? 0,
                          idxEstudiante: AppConstant.selectedMember?.idxEstudiante ?? 0,
                          observacion: controller.text,
                          tipo: selectedItem?.tipoMaestro ?? "",
                          lado: "",
                          zoom: false,
                          zoomurl: ""
                      );
                      cubit.fetchMeetAppointmentRequest(request);
                    }else {
                      AppUtils.showErrSnack("now you can  submit", context);
                    }

                  }),
                ],),
                gapH(20.h),
              ],),
            ),
          ),
        );
      },
    );
  }

  void showUserSelectionDialog(BuildContext context,
      List<MeetEliglibleList> categories) async {
    var  r = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.only(bottom: 100.h, left: 0, right: 0),
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppAssets.close, width: 30.w, height: 30.h,))

                  ],),
                gapH(10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: MeetEliglibleList.groupByCargo(cubit.eligibleList).length,
                    itemBuilder: (context, index) {
                      return  CollapsibleCategoryWidget(
                        category:  MeetEliglibleList.groupByCargo(cubit.eligibleList)[index],
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
    if (r is MeetEliglibleList){
      print("the list selection works: ${r.nombre}");
      setState(() {
        selectedItem = r;
      });
    }
  }


}
