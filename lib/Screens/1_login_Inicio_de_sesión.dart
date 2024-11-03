import 'dart:developer';

import 'package:bs_educativo/LocalStorage/Constants.dart';
import 'package:bs_educativo/LocalStorage/UserUtils.dart';
import 'package:bs_educativo/Screens/2_main_menu_screen.dart';
import 'package:bs_educativo/model/request/LoginRequest.dart';
import 'package:bs_educativo/model/response/LoginResponse.dart';
import 'package:bs_educativo/model/response/loginIndividualResponse.dart';
import 'package:bs_educativo/utility/Alerts/AlertDialog.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

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
  final LocalAuthentication auth = LocalAuthentication();
  var canAuthenticateWithBiometrics = false;
  var biometricEnabled = false;

  initBiometric() async {
    canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    await _getSavedValidateUserRequest();
    biometricEnabled =   await SharedPref.getBool(SharedPrefKeys.enableBiometric);
    final List<BiometricType> availableBiometrics =
    await auth.getAvailableBiometrics();
    if (canAuthenticateWithBiometrics && biometricEnabled) {
      if (availableBiometrics.isNotEmpty) {
        if (availableBiometrics.contains(BiometricType.weak) ||
            availableBiometrics.contains(BiometricType.strong) || availableBiometrics.contains(BiometricType.fingerprint)) {
          AppUtils.debug("available biometric weak or strong $availableBiometrics");
        } else {
          AppUtils.debug("available biometric face");
        }
      }
    }
    setState(() {});
  }
  _getSavedValidateUserRequest() async {
    try {
      var userPref = await SharedPref.read(SharedPrefKeys.loginRequestInfo);
      Constants.loginRequest = LoginRequest.fromJson(userPref);
    } catch (e) {
      AppUtils.debug("could not get login request $e");
    }
  }
  _authenticateWithBiometric() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Por favor, autentíquese para iniciar sesión');
      if (didAuthenticate){
        if (Constants.loginRequest != null) {
          cubit.login(Constants.loginRequest!);
        }
      }
    } on PlatformException {
      AppUtils.debug("wahala");
    }
  }

  @override
  void initState() {
    super.initState();
    _getSavedValidateUserRequest();
    initBiometric();
  }
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
            log("userloginResponse: ${AppConstant.userLoginResponse?.toJson()}");
            AppConstant.appUserType = AppConstant.userLoginResponse?.idxAdministrativo != null ? "Admin"  : "Individual";
            AppConstant.collegeName = AppConstant.userLoginResponse?.colegio ?? "";
            if ((AppConstant.userLoginResponse?.familyMembers ?? []).isNotEmpty) {
              AppConstant.selectedMember = AppConstant.userLoginResponse?.familyMembers?[0];
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration.zero, ()
              {
                if (biometricEnabled) {
                  openHome();
                } else {
                  openBottomSheet2(
                      isDismissible: false, context, CustomAlertDialog(
                      showIcon: true,
                      body: "¿Quieres utilizar tus datos biométricos la próxima vez que inicies sesión?",
                      proceedText: "Sí, habilitar",
                      declineText: "No, inhabilitar",
                      proceed: () async {
                        Navigator.pop(context);
                        await SharedPref.saveBool(
                            SharedPrefKeys.enableBiometric, true).then((
                            value) =>
                            openHome());
                      },
                      decline: () {
                        Navigator.pop(context);
                        openHome();
                      })
                  );
                  cubit.resetState();
                }
              });
            });
          }
          return AppUtils.loadingWidget(
            isLoading: state is AuthLoadingState,
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
                            iconTxt: AppAssets.key, isPassword: true,),
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
                        if (biometricEnabled )
                          GestureDetector(
                            onTap: (){
                              FocusManager.instance.primaryFocus?.unfocus();
                              _authenticateWithBiometric();
                            },
                            child:   fingerWidget(),
                          ),
                        gapH(40.h),
                      ],),
                  )


                ],),))

              ],),),
          );
        }
    );
  }

  void openHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
        const MainMenuScreen()));
      });
    });
  }
}


