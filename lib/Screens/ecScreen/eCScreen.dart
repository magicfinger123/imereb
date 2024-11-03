import 'package:bs_educativo/cubit/EC/ec_cubit.dart';
import 'package:bs_educativo/main.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../apiService/api_service.dart';
import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class EcScreen extends StatefulWidget {
  const EcScreen({super.key});

  @override
  State<EcScreen> createState() => _EcScreenState();
}

class _EcScreenState extends State<EcScreen> {
  late EcCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      cubit.getPaymentData(GeneralRequest(
          idColegio: AppConstant.userLoginResponse?.idColegio,
          idioma: 1,
          cedula: AppConstant.userLoginResponse?.cedula
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read<EcCubit>();
    return BlocBuilder<EcCubit, EcState>(
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is EcLoadingState,
          child: BgScaffold(
              body: MenuDesign(
                isAdmin: AppConstant.appUserType == "Admin",
                institution: AppConstant.collegeName ?? "",
                selectedUser: AppConstant.selectedMember?.nombreCompleto??"", group: group, counselor: counselor,
                userName: AppConstant.appUserType == "Admin"? AppConstant.userLoginResponse?.usuario??'':"",
                role: AppConstant.appUserType == "Admin"? 'Login: ${AppConstant.userLoginResponse?.nombre??''}':"",
                selectUserTap: () {
                  setState(() {
                  });
                },
                container:
                Column(
                  children: [
                    Container(
                      decoration: deco(),
                      child: Column(children: [
                        heading(),
                        gapH(10.h),
                        SizedBox(height: 470.h,
                          child:
                          ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
                              itemCount:cubit.paymentData.length,
                              itemBuilder: (context, index) {
                                final fin = cubit.paymentData[index];
                                var isCredit = (fin.credit ?? 0) > 0;
                                return GestureDetector(onTap: (){

                                },
                                  child: finEcWidget(paymentData: fin,
                                      amount:isCredit ? fin.credit.toString() : fin.debito.toString(),isCredit: isCredit,
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
              )),
        );
      },
    );
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
