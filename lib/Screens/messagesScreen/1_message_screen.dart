import 'package:bs_educativo/Screens/messagesScreen/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';


class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
        body: MenuDesign(
          selectedUser: selectedUser, group: group, counselor: counselor,
          selectUserTap: () {  },
          container:
          Expanded(
            child: Column(
              children: [
                Expanded(child: MessagingScreenV2()),
                  backAndIcon((){
                    Navigator.pop(context);
                  },
                  (){
            
                    },
                      AppAssets.compose,size: 61.0),
              ],
            ),
          ),
          // Expanded(child: Column(children: [
          //   Expanded(
          //       child: Container(width: double.infinity,
          //           padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(6.r),
          //               color: AppColors.white,
          //
          //           ),
          //           child: SingleChildScrollView(child:Column(children: [
          //             gapH(40.h),
          //
          //
          //           ],)))
          //   ),
          //   gapH(20.h),
          //
          //   backAndIcon((){
          //     Navigator.pop(context);
          //   },
          //   (){
          //
          //     },
          //       AppAssets.compose,size: 61.0),
          // ],
          // ),
          // ),



        ));
  }
}
