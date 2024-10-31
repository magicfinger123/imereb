
import 'package:bs_educativo/Screens/messagesScreen/2.1_MessageView.dart';
import 'package:bs_educativo/Screens/messagesScreen/2.2_composeMessageView.dart';
import 'package:bs_educativo/cubit/Message/message_cubit.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<MsgAttachment> attachment =[];
  late MessageCubit cubit;

  void _onScreenSelected(int index, {MessageData? message}) {
    if (message != null) {
      selectedMessage  = message;
    }
    setState(() {
      if (index == 0){
        secondIcon = AppAssets.compose;
      }
      if (index == 2){
        secondIcon = AppAssets.send;
      }
      if (_currentIndex == 0) {
        secondIcon = AppAssets.compose;
        if (index == 1){
          cubit.messageAttachment(MessageRequest(
              idxMensaje: selectedMessage?.idxMensaje?.toInt().toString()));
        }else{
          _currentIndex = index;
        }
      } else if (_currentIndex == 1) {
        secondIcon = AppAssets.trash;
        _currentIndex = index;
      } else if (_currentIndex == 2) {
        secondIcon = AppAssets.compose;
        _currentIndex = index;
      }
    });
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    cubit = context.read();
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if (state is MessageAttachmentState){
          attachment = state.response;
          WidgetsBinding.instance.addPostFrameCallback((_){
            secondIcon = AppAssets.trash;
            _currentIndex = 1;
            cubit.resetState();
          });
        }
        if (state is MessageDeleteState){
          WidgetsBinding.instance.addPostFrameCallback((_){
            AppUtils.showErrSnack("mensaje eliminado", context);
            _onScreenSelected(0);// = 0;
            cubit.resetState();
          });
        }
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
              // selectUserTap: () {  },
              container:
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: IndexedStack(
                          index: _currentIndex, // Switch between screens
                          children: [
                            MessageTab(onScreenChange: _onScreenSelected ,),
                            MessageView(onScreenChange: _onScreenSelected, messageData: selectedMessage, attachment: attachment,),
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
                        secondIcon,size: 45.0),
                  ],
                ),
              ),
            ));
      },
    );
  }
  checkBackTap(){
    if(_currentIndex == 0){
      Navigator.pop(context);
    }else {
      _onScreenSelected(0);
    }
  }
  checkSecondBtnActions(){
    if(_currentIndex == 0){
      _onScreenSelected(2);
    }
    if(_currentIndex == 1){
      cubit.postDeleteMessage(MessageRequest(idxMensaje: selectedMessage?.idxMensaje?.toInt().toString(),
          idxMaestro: AppConstant.userLoginResponse?.idxMaestro?.toInt().toString()));
  //    _onScreenSelected(2);
    }
  }
}

