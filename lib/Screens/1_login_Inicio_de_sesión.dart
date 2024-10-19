import 'package:bs_educativo/Screens/2_main_menu_screen.dart';
import 'package:bs_educativo/model/request/LoginRequest.dart';
import 'package:bs_educativo/model/response/LoginResponse.dart';
import 'package:bs_educativo/model/response/loginIndividualResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../apiService/api_service.dart';
import '../cubit/authCubit/auth_cubit.dart';
import '../utility/app_util.dart';
import '../utility/colors.dart';
import '../utility/iconsAndImages.dart';
import '../utility/text_widgets.dart';
import '../utility/widgets.dart';


class LoginScreenInicio extends StatefulWidget {
  const LoginScreenInicio({super.key});

  @override
  State<LoginScreenInicio> createState() => _LoginScreenInicioState();
}

class _LoginScreenInicioState extends State<LoginScreenInicio> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  late AuthCubit cubit;
  String enterUsernameAndPasswordMsd = "Ingrese un nombre de usuario y contraseña válidos";
  @override
  Widget build(BuildContext context) {
    cubit  =  context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthStateErrorState) {
            var msg = state.errorResponse;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration.zero, (){
                AppUtils.showErrSnack(msg ?? "Error occurred z", context);
              });
            });
            cubit.resetState();
          }
          if (state is LoginSuccessState) {
            userLoginResponse = state.response;
            appUserType = "Parent";
            selectedMember = userLoginResponse?.familyMembers?[0];
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Future.delayed(Duration.zero, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const MainMenuScreen()));
                });
              });
              cubit.resetState();
          }
          if (state is LoginIndividualSuccessState) {
            individualLoginResponse = state.response;
            appUserType = "Individual";
            selectedMember = individualLoginResponse?.familyMembers?[0];
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration.zero, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                const MainMenuScreen()));
              });
            });
            cubit.resetState();
          }
          if (state is LoginAdminSuccessState) {
            appUserType = "Admin";
            adminLoginResponse = state.response;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration.zero, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                const MainMenuScreen()));
              });
            });
            cubit.resetState();
          }

        return AppUtils.loadingWidget(
          isLoading: state is ApiLoadingState,
          child: BgScaffold(
            body: Column(children: [
              gapH(20.h),
              Expanded(child: SingleChildScrollView(child: Column(children: [
                topLogoAndTxt(),
                gapH(60.h),
                SizedBox(width: double.infinity,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    txtB("Inicio de sesión", 20.sp),
                    gapH(20.h),
                    txtR("Inicio de sesión con tu cuenta de i-Mereb", 17.sp),
                    gapH(30.h),
                      CtmTextField(controller: controller1, title: "Usuario",
                          iconTxt: AppAssets.user),
                      gapH(30.h),
                      CtmTextField(controller: controller2, title: "Contraseña",
                          iconTxt: AppAssets.key),
                      gapH(40.h),
                      blueBtn("Ingresar", (){
                        if(controller1.text.isNotEmpty && controller1.text.isNotEmpty){
                          cubit.login(
                              LoginRequest(
                                  username: controller1.text.replaceAll(' ', ''),
                                  password: controller2.text.replaceAll(' ', ''))
                          );
                        }else{
                          FocusManager.instance.primaryFocus?.unfocus();
                          // Future.delayed(Duration.zero, (){
                            AppUtils.showErrSnack(enterUsernameAndPasswordMsd, context);
                          // });
                        }
                      }),
                      gapH(100.h),
                      fingerWidget(),
                      gapH(40.h),








                  ],),
                )


              ],),))

          ],),),
        );
      }
    );
  }




}


