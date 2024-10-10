import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/1_login_Inicio_de_sesión.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(424, 932),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   // This is the theme of your application.
          //   //
          //   // TRY THIS: Try running your application with "flutter run". You'll see
          //   // the application has a purple toolbar. Then, without quitting the app,
          //   // try changing the seedColor in the colorScheme below to Colors.green
          //   // and then invoke "hot reload" (save your changes or press the "hot
          //   // reload" button in a Flutter-supported IDE, or press "r" if you used
          //   // the command line to start the app).
          //   //
          //   // Notice that the counter didn't reset back to zero; the application
          //   // state is not lost during the reload. To reset the state, use hot
          //   // restart instead.
          //   //
          //   // This works for code too, not just values: Most code changes can be
          //   // tested with just a hot reload.
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          home: splashScreen(),
        );
      }
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


