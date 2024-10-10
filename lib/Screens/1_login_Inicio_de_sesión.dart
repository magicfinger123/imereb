import 'package:bs_educativo/Screens/2_main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
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
                CtmTextField(controller: controller1, title: "Contraseña",
                    iconTxt: AppAssets.key),
                gapH(40.h),
                blueBtn("Ingresar", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const MainMenuScreen()));
                }),
                gapH(100.h),
                fingerWidget(),
                gapH(40.h),








            ],),
          )


        ],),))

    ],),);
  }




}


