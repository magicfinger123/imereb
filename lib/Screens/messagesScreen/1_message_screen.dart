
import 'package:bs_educativo/Screens/messagesScreen/2.1_MessageView.dart';
import 'package:bs_educativo/Screens/messagesScreen/2.2_composeMessageView.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apiService/api_service.dart';
import '../../utility/colors.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';
import '2.0_messageTab.dart';




class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
 String secondIcon = AppAssets.compose;
 MessageData? selectedMessage;

  void _onScreenSelected(int index, {MessageData? message}) {
    selectedMessage  = message;
    setState(() {
      _currentIndex = index;
      if(_currentIndex == 0){
        secondIcon = AppAssets.compose;
      }else if(_currentIndex == 1){
        secondIcon = AppAssets.trash;
      }else if(_currentIndex == 2){
        secondIcon = AppAssets.send;
      }
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
        body: MenuDesign(
          isAdmin: AppConstant.appUserType == "Admin",
          institution:
          // appUserType == "Admin"?
          // adminLoginResponse?.collegeName??'':
          AppConstant.userLoginResponse?.colegio??'',
          selectedUser: AppConstant.selectedMember?.nombreCompleto??"", group: group, counselor: counselor,
          userName: AppConstant.appUserType == "Admin"? AppConstant.userLoginResponse?.usuario??'':"",
          role: AppConstant.appUserType == "Admin"? 'Login: ${AppConstant.userLoginResponse?.nombre??''}':"",
          selectUserTap: () {  },
          container:
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: _currentIndex, // Switch between screens
                    children: [
                       MessageTab(onScreenChange: _onScreenSelected ,),
                       MessageView(onScreenChange: _onScreenSelected, messageData: selectedMessage,),
                       ComposeMessageView(onScreenChange:_onScreenSelected),
                    ] // Screens to switch between
                  ),
                ),
                gapH(10.h),
                  backAndIcon((){
                        checkBackTap();
                    },
                  ()
                    {
                     checkSecondBtnActions();
                    },
                    secondIcon,size: 61.0),
              ],
            ),
          ),
        ));
  }
  checkBackTap(){
     if(_currentIndex == 0){
          Navigator.pop(context);
     }else if(_currentIndex == 1){
       _onScreenSelected(0);
     }else if(_currentIndex == 2){
       _onScreenSelected(0);
     }
  }
  checkSecondBtnActions(){
    if(_currentIndex == 0){
      _onScreenSelected(2);
    }
  }
}

