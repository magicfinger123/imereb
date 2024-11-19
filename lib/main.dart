import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bs_educativo/cubit/Agenda/agenda_cubit.dart';
import 'package:bs_educativo/cubit/Alert/alert_cubit.dart';
import 'package:bs_educativo/cubit/Document/document_cubit.dart';
import 'package:bs_educativo/cubit/EC/ec_cubit.dart';
import 'package:bs_educativo/cubit/Message/message_cubit.dart';
import 'package:bs_educativo/cubit/Notes/note_cubit.dart';
import 'package:bs_educativo/cubit/QR/qr_cubit.dart';
import 'package:bs_educativo/cubit/Tips/tips_cubit.dart';
import 'package:bs_educativo/cubit/coupon/coupon_cubit.dart';
import 'package:bs_educativo/cubit/meet/meet_cubit.dart';
import 'package:bs_educativo/model/response/LoginResponse.dart';
import 'package:bs_educativo/repository/AgendaRepository.dart';
import 'package:bs_educativo/repository/AlertRepository.dart';
import 'package:bs_educativo/repository/CuponRepository.dart';
import 'package:bs_educativo/repository/DocumentRepository.dart';
import 'package:bs_educativo/repository/EcRepository.dart';
import 'package:bs_educativo/repository/MeetRepository.dart';
import 'package:bs_educativo/repository/QRRepository.dart';
import 'package:bs_educativo/repository/authRepository.dart';
import 'package:bs_educativo/repository/messageRepository.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Screens/1_login_Inicio_de_sesión.dart';
import 'cubit/authCubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/NoteRepository.dart';
import 'repository/TipsRepository.dart';
import 'utility/AppConstant.dart';
import 'utility/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider( providers: [
      BlocProvider(create: (BuildContext context) => AuthCubit( authRepository: AuthRepo())),
      BlocProvider(create: (BuildContext context) => MessageCubit( repository: MessageRepository())),
      BlocProvider(create: (BuildContext context) => DocumentCubit( repository: DocumentRepository())),
      BlocProvider(create: (BuildContext context) => AgendaCubit( repository: AgendaRepository())),
      BlocProvider(create: (BuildContext context) => MeetCubit( repository: MeetRepository())),
      BlocProvider(create: (BuildContext context) => EcCubit(EcRepository())),
      BlocProvider(create: (BuildContext context) => NoteCubit(NoteRepository())),
      BlocProvider(create: (BuildContext context) => TipsCubit(TipsRepository())),
      BlocProvider(create: (BuildContext context) => QrCubit(QrRepository())),
      BlocProvider(create: (BuildContext context) => AlertCubit(AlertRepository())),
      BlocProvider(create: (BuildContext context) => CouponCubit(CuponRepository())),
    ],
      child: ScreenUtilInit(
          designSize: const Size(424, 932),
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
            decoration: const BoxDecoration(
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


