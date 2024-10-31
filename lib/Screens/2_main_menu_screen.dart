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
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../apiService/api_service.dart';
import '../model/response/LoginResponse.dart';
import '../utility/colors.dart';
import '../utility/text_widgets.dart';
import '../utility/widgets.dart';




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
        institution:
        // appUserType == "Admin"?
        // adminLoginResponse?.collegeName??'':
        AppConstant.collegeName ?? "",

        selectedUser: AppConstant.selectedMember?.nombreCompleto??"",
        group: "", counselor: "",
        // selectUserTap: () {
        //   _selectStudent();
        // },
        isAdmin: AppConstant.appUserType == "Admin",
        userName: AppConstant.appUserType == "Admin"? AppConstant.userLoginResponse?.usuario??'':"",
        role: AppConstant.appUserType == "Admin"? 'Login: ${AppConstant.userLoginResponse?.nombre??''}':"",
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
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 30.h),
              child:
              AppConstant.userLoginResponse?.idxAdministrativo != null ?
              menuItemsAdmin(
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
                  agenderTap: (){
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
                  califioriTap: (){},
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
                  },
                estatusTap: (){}
              ):
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
        isBiosLogo: true,
      ),);
  }


    // var result =  await showModalBottomSheet(
    //     isDismissible: true,
    //     isScrollControlled: true,
    //     context: context,
    //     builder: (context) => Padding(
    //       padding: EdgeInsets.only(
    //           bottom: MediaQuery.of(context).viewInsets.bottom),
    //       child:  SelectFamilyMemberBottomSheet(userFamilyMembers: userLoginResponse.familyMembers,),
    //     )
    // );
    // if(result is Bank){
    //   setState(() {
    //     selectedBank = result;
    //     bankController.text = selectedBank?.bankname ?? "";
    //     if (accountNumberController.text.length == 10){
    //       bloc.add(
    //           TransactionAccountVerificationEvent(
    //               AccountVerification(
    //                   accountNumber: accountNumberController.text,
    //                   bankCode: selectedBank?.bankCode ?? ""))
    //       );
    //     }
    //   });
    // }
  }







