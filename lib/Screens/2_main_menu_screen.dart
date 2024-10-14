import 'package:bs_educativo/Screens/agendaScreen/1_agendaScreen.dart';
import 'package:bs_educativo/Screens/alertsScreen/alertScreen.dart';
import 'package:bs_educativo/Screens/citasothersScreen/1_citasOthersScreen.dart';
import 'package:bs_educativo/Screens/couponScreen/1_coupon_screen.dart';
import 'package:bs_educativo/Screens/detailedRatingsScreen/1_ratingsScreen.dart';
import 'package:bs_educativo/Screens/documentScreen/1_document_screen.dart';
import 'package:bs_educativo/Screens/ecScreen/eCScreen.dart';
import 'package:bs_educativo/Screens/messagesScreen/1_message_screen.dart';
import 'package:bs_educativo/Screens/qRScreen/1_qrScreen.dart';
import 'package:bs_educativo/Screens/tipsScreen/1_tips_screen.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/colors.dart';
import '../utility/text_widgets.dart';
import '../utility/widgets.dart';
String selectedUser = 'James Watts';
String group = 'I - A';
String counselor = 'Cristina Arcia';
class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
      body: MenuDesign(
        institution: 'Colegio Internacional de Panamá',
        selectedUser: selectedUser, group: group, counselor: counselor,
        selectUserTap: () {  },
        container:
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.white,
              border: Border.all(color: AppColors.border,width: 2.5.r)
            ),
            child: SingleChildScrollView(child:
            menuItems(
                qrTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const QRScreen()));
                },
                messageTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const MessageScreen()));
                },
                threetap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const RatingsScreen()));
                },
                fourTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const EcScreen()));
                 },
                calendarTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const AgendaScreen()));
                },
                clockTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const CitasOthersScreen()));
                },
                documentTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const DocumentScreen()));
                },
                matricTap: (){},
                alertTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const AlertScreen()));
                },
                tipsTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const TipsScreen()));
                  },
                couponTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const CouponScreen()));
                }
            ),),
          ),
        ),
        isBiosLogo: false,
      ),);
  }


}



