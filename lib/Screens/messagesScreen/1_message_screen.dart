
import 'package:bs_educativo/Screens/messagesScreen/2.1_MessageView.dart';
import 'package:bs_educativo/Screens/messagesScreen/2.2_composeMessageView.dart';
import 'package:bs_educativo/cubit/Message/message_cubit.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/request/SendMessageAttachRequest.dart';
import 'package:bs_educativo/model/request/SendMessageRequest.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../apiService/api_service.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '2.0_messageTab.dart';
import '2.2_replyMessageView.dart';




class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String secondIcon = AppAssets.compose;
  MessageData? selectedMessage;
  List<MsgAttachment> attachment = [];
  late MessageCubit cubit;
  SendMessageRequest? sendMessageRequest;
 void _onScreenSelected(int index, {MessageData? message}) {
    if (message != null) {
      selectedMessage = message;
    }
    setState(() {
      switch (index) {
        case 0:
          secondIcon = AppAssets.compose;
          break;
        case 1:
          secondIcon = AppAssets.trash;
          break;
        case 2:
          secondIcon = AppAssets.send;
          break;
        case 3:
          secondIcon = AppAssets.send;
          break;
      }
      if (_currentIndex == 0 && index == 1) {
        cubit.messageAttachment(MessageRequest(
          idxMensaje: selectedMessage?.idxMensaje?.toInt().toString(),
        ));
      }
      _currentIndex = index;
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
            _onScreenSelected(0);// = 0
            cubit.resetState();
          });
        }

        if (state is MessageSentState) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            if ((sendMessageRequest?.fileName ?? "").isNotEmpty){
              cubit.postSendMessageAttach(SentMsgArchiveRequest(
                  idxMensaje: state.response.idxMensaje ?? "",
                  url: sendMessageRequest?.archivo ?? "",
                  fileName: sendMessageRequest?.fileName ?? "",
                  fileSize: sendMessageRequest?.fileSize ?? ""));
            }else{
              AppUtils.showSuccessSnack("Mensaje enviado con éxito. 🎉", context);
              sendMessageRequest = null;
              cubit.resetState();
            }
            _onScreenSelected(0);

          });
        }
        if (state is MessageSentAttachState) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            AppUtils.showSuccessSnack("Mensaje enviado con éxito. 🎉", context);
            sendMessageRequest = null;
            cubit.resetState();
          });
        }
        return BgScaffold(
            body: GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: MenuDesign(
                isAdmin: AppConstant.appUserType == "Admin",
                institution:
                // appUserType == "Admin"?
                // adminLoginResponse?.collegeName??'':
                AppConstant.userLoginResponse?.colegio??'',
                selectedUser: AppConstant.selectedMember?.nombreCompleto??"", group: group, counselor: counselor,
                userName: AppConstant.appUserType == "Admin"? AppConstant.userLoginResponse?.usuario??'':"",
                role: AppConstant.appUserType == "Admin"? 'Login: ${AppConstant.userLoginResponse?.nombre??''}':"",
                selectUserTap: () {
                  setState(() {
                  });
                },
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
                              ComposeMessageView(onScreenChange:_onScreenSelected, onSelectionChanged: (SendMessageRequest value) {
                                sendMessageRequest = value;
                              }),
                              ReplyMessageView(onScreenChange:_onScreenSelected, onSelectionChanged: (SendMessageRequest value) {
                                sendMessageRequest = value;
                              }, messageData: selectedMessage, attachment: attachment,)
                            ] // Screens to switch between
                        ),
                      ),
                      gapH(10.h),
                      backAndIcon((){
                        checkBackTap();
                      },()
                      {
                        checkSecondBtnActions();
                      },
                          secondIcon,size: 45.0),
                    ],
                  ),
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

      if (_currentIndex == 2 || _currentIndex == 3) {
        if (sendMessageRequest == null) {
          // setState(() {
          //  AppUtils.showErrSnack("Please fill all fields", context);
          // });
          return;
        } else {
          if (sendMessageRequest?.asunto.isEmpty == true){
            setState(() {
              AppUtils.showErrSnack("El asunto no puede estar vacío.", context);
            });
            return;
          }
          if (sendMessageRequest?.contenido.isEmpty == true){
            setState(() {
              AppUtils.showErrSnack("El cuerpo del mensaje no puede estar vacío.", context);
            });
            return;
          }
          if (sendMessageRequest?.desidxMaestro.isEmpty == true){
            setState(() {
              AppUtils.showErrSnack(
                  "Por favor, seleccione el destinatario.", context);
            });
            return;
          }
        }
        cubit.postSendMessage(sendMessageRequest!);
      }

  }
}

