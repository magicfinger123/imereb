import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bs_educativo/repository/authRepository.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/1_login_Inicio_de_sesión.dart';
import 'cubit/authCubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider( providers: [
      BlocProvider(create: (BuildContext context) => AuthCubit( authRepository: AuthRepo())),
    ],
      child: ScreenUtilInit(
          designSize: const Size(424, 932),
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (context, child) {
          return MaterialApp(
            title: 'Bs Educativo',

            home: splashScreen(),
          );
        }
      ),
    );
  }
}

Widget splashScreen() {
  return AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 1000,
        splash: Container(width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                image: DecorationImage(
                    image: AssetImage(AppAssets.bg),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
            children: [
              Spacer(),
              Image.asset(AppAssets.logo1,width: 250.w,height: 250.h,),
              Spacer(),


                        ],
                      ),
        ),
        centered: false,
        nextScreen: const LoginScreenInicio(),
        backgroundColor: Color(0xFFF7F7F7),
      );
}


