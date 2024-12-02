import 'package:bs_educativo/cubit/Message/message_cubit.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/request/getMsgRequest.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/listOfMessagesResponse.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:bs_educativo/utility/colors.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_lifecycle/flutter_page_lifecycle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../utility/text_widgets.dart';

class MessageTab extends StatefulWidget {
  final Function(int, {MessageData? message}) onScreenChange;
  const MessageTab({super.key, required this.onScreenChange});

  @override
  _MessageTabState createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  String selectedCategory = 'Entrada'; // Default category
  final List<String> categories = ['Entrada', 'Salida','Eliminados', 'No leídos', 'Leídos'];
  bool _isDropdownVisible = false;
  String selectedMsgType = "Entrada";
  late MessageCubit cubit;
  List<Messages> messages = [];
  List<Messages> sortedMessaages = [];
  List<Messages> filteredMessages = [];
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      filterItems();
    });
  }

  void filterItems() {
    setState(() {
      filteredMessages = sortedMessaages
          .where((item) {
            return (item.asunto ?? "").toLowerCase().contains(searchController.text.toLowerCase()) || (item.remitenteNombre ?? "").toLowerCase().contains(searchController.text.toLowerCase()) ;
          }).toList();
    });
  }

  void getReadItems() {
      var nm = messages
          .where((item) {
        return (item.checkRead());
      }).toList();
      cubit.setUnreadReadMessages(nm);
  }
  void getUnReadItems() {
    var nm = messages
          .where((item) {
        return (item.checkRead() == false);
      }).toList();
    cubit.setUnreadReadMessages(nm);
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read<MessageCubit>();
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if (state is MessageInboxState){
          messages = state.response;
          sortedMessaages = state.response;
          filteredMessages = state.response;
        //  selectedMsgType = "Entrada";
          if (selectedMsgType == "Leídos" ){
            getReadItems();
          }
          if (selectedMsgType == "No leídos" ){
            getUnReadItems();
          }
          // switch (selectedMsgType) {
          //   case "Leídos":
          //     getReadItems();
          //     break;
          //   case "No leídos":
          //     getUnReadItems();
          //     break;
          //   default:
          //     break;
          // }
          cubit.getMessageCount(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));
        }
        if (state is MessageSortState){
          sortedMessaages = state.response;
          filteredMessages = state.response;
          cubit.resetState();
        }
        if (state is MessageInboxDataState){
          WidgetsBinding.instance.addPostFrameCallback((_){
            Future.delayed(Duration.zero, (){
              widget.onScreenChange(1, message: state.response[0]);
            });
          });
          cubit.resetState();
        }
        return PageLifecycle(
          stateChanged: (bool appeared) {
            if(appeared){
              selectedMsgType = "Entrada";
              cubit.fetchInbox(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));
            }
          },
          child: LoadingOverlay(
            isLoading: state is MessageLoading,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.white,),
                  child: Column(
                    children: [
                      Container(height: 70.h,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: const Offset(0.0, 5),
                            )],
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(crossAxisAlignment:CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _isDropdownVisible = !_isDropdownVisible;
                                      });
                                    },
                                    child: Image.asset(AppAssets.menu,width: 30.h,height: 30.h,fit: BoxFit.fitHeight,)),
                                gapW(20.w),
                                Stack(children: [
                                  Container(height: 25.h, width: 35.w, child: Align( alignment: Alignment.bottomCenter,child: Image.asset(AppAssets.inbox,width: 25.h,height:250.h,fit: BoxFit.cover,))),
                                 if  (cubit.messageCounts.isNotEmpty)
                                  Positioned(
                                  top: -3,
                                  right: 2,
                                  child: Text(
                                    '${cubit.messageCounts[0].cantidad}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),]),
                                gapW(20.w),
                                SizedBox(width: 205.w,height: 30.h,
                                  child: TextField(
                                      style: GoogleFonts.inter(
                                        color: AppColors.txt1,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      cursorHeight: 10.h,
                                      cursorColor: AppColors.blueBa,
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        fillColor: AppColors.white,
                                        filled: true,
                                        hintText: "Buscar en Mensajería",
                                        hintStyle: GoogleFonts.inter(
                                          color: AppColors.txt1,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        contentPadding: EdgeInsets.only(bottom: 0,top: 0,left: 10.w,right: 10.w),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6.r),
                                          borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6.r),
                                          borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6.r),
                                          borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                                        ),
                                      )
                                  ),
                                ),
                              ],),
                            txtR(selectedMsgType,15.sp,weight: FontWeight.w600)
                          ],
                        ),
                      ),
                      gapH(10.h),
                      Expanded(
                        child:ListView.builder(
                            padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                            itemCount: filteredMessages.length,
                            itemBuilder: (context, index) {
                              final msgs = filteredMessages[index];
                              return  InkWell(
                                child: messageItemWidget(onTap:
                                    (){
                                 // widget.onScreenChange(1);
                                      cubit.markMessageAsRead(MessageReadRequest(idMensaje: msgs.idmensaje!.toInt(), idxMaestro: AppConstant.userLoginResponse?.idxMaestro?.toInt() , tipoMaestro: AppConstant.userLoginResponse?.tipoMaestro));
                                      cubit.readInboxMessage(MessageIdRequest(idMensaje: msgs.idmensaje!.toInt().toString()));
                                },title:msgs.asunto??'',
                                    description: msgs.remitenteNombre??'',date: AppUtils.getDate(msgs.fechaenvio.toString(),"HH:mm MMM, dd"),
                                  isRead: msgs.checkRead()
                                ),
                              );}
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _isDropdownVisible,
                  child: Positioned(
                      top: 80.h,
                      left: 0,
                      child: Container(
                        width: 192.w,height: 247.h,
                        decoration: BoxDecoration(color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0.0, 4),
                            )],
                        ),
                        child: Column(children: [
                          msgDropListItemsWidget("Entrada",AppAssets.inbox,(){
                            selectedMsgType = "Entrada";
                            _isDropdownVisible = !_isDropdownVisible;
                            cubit.fetchInbox(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));

                          }),
                          msgDropListItemsWidget("Salida",AppAssets.send,(){
                            selectedMsgType = "Salida";
                            _isDropdownVisible = !_isDropdownVisible;
                            cubit.fetchSentMessage(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));

                          }),
                          msgDropListItemsWidget("Eliminados",AppAssets.trash,(){
                            selectedMsgType = "Salida";
                            _isDropdownVisible = !_isDropdownVisible;
                            cubit.fetchDeletedMessage(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));
                          }),
                          msgDropListItemsWidget("No leídos",AppAssets.inbox,(){
                            setState(() {
                              selectedMsgType = "No leídos";
                              _isDropdownVisible = !_isDropdownVisible;
                              cubit.fetchInbox(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));

                            });
                          }),
                          msgDropListItemsWidget("Leídos",AppAssets.openInbox,(){
                            setState(() {
                              selectedMsgType = "Leídos";
                              _isDropdownVisible = !_isDropdownVisible;
                              cubit.fetchInbox(GetMessageListRequest(idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(), cedula: AppConstant.userLoginResponse!.cedula!));
                            });
                          }),

                        ],),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}