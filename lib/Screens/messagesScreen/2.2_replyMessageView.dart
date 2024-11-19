import 'dart:convert';
import 'dart:io';

import 'package:bs_educativo/cubit/Message/message_cubit.dart';
import 'package:bs_educativo/model/request/ContactRequest.dart';
import 'package:bs_educativo/model/request/SendMessageRequest.dart';
import 'package:bs_educativo/model/response/message/ArchiveRequest.dart';
import 'package:bs_educativo/model/response/message/ContactList.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_lifecycle/flutter_page_lifecycle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../utility/colors.dart';
import '../../utility/widgets.dart';
import 'package:path/path.dart' as path;


class ReplyMessageView extends StatefulWidget {
  final Function(int) onScreenChange;
  final ValueChanged<SendMessageRequest> onSelectionChanged;
  final MessageData? messageData;
  final List<MsgAttachment> attachment;
  const ReplyMessageView({super.key, required this.onScreenChange, required this.onSelectionChanged, required this.messageData, required this.attachment});
  @override
  State<ReplyMessageView> createState() => _ReplyMessageViewState();
}

class _ReplyMessageViewState extends State<ReplyMessageView> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  TextEditingController msg2Controller = TextEditingController();
  late MessageCubit cubit;
  List<Contact> contacts = [];
  Map<String, String> selectedContact = {};
  Map<String, String> selectedCCContact = {};
  Map<String, String> selectedCCOContact = {};

  File? file;
  double fileSize = 0.0;
  String imageUploaded = "";

  @override
  void initState() {
    super.initState();
    // widget.onSendMessage {sendMessage();}
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read();
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if (state is MessageContactState) {
          contacts = state.response;
        }
        if (state is ArchiveState) {
          imageUploaded = state.response;
        }
        return PageLifecycle(
          stateChanged: (bool appeared) {
            if (appeared) {
              if (descriptionController.text.isEmpty) {
                descriptionController.text = widget.messageData?.asunto ?? "";
                msg2Controller.text =
                    "\n\n______\n${widget.messageData?.contenido}" ?? "";
              }
              cubit.getContacts(ContactRequest(
                  idxMaestro: AppConstant.userLoginResponse?.idxMaestro
                      ?.toInt(),
                  idcolegio: AppConstant.userLoginResponse?.idColegio,
                  tipoMaestro: AppConstant.userLoginResponse?.tipoMaestro));
              buildSendMessageRequest();
            }
          },
          child: LoadingOverlay(
            isLoading: state is MessageLoading,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.border, width: 2.5.r)
              ),
              child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: AppColors.white,
                          border: Border(bottom: BorderSide(
                              color: AppColors.border, width: 1.5.r)),
                          boxShadow: [
                            BoxShadow(color: AppColors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]
                      ),
                      child: Column(children: [
                        gapH(10.h),
                        SizedBox(width: double.infinity, height: 30.h,
                          child: TextField(
                              onChanged: (value){
                                descriptionController.text = value;
                                buildSendMessageRequest();
                              },
                              controller: descriptionController,
                              style: GoogleFonts.inter(
                                color: AppColors.txt1,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              cursorHeight: 10.h,
                              cursorColor: AppColors.blueBa,
                              decoration: InputDecoration(
                                fillColor: AppColors.white,
                                filled: true,
                                hintText: "título",
                                hintStyle: GoogleFonts.inter(
                                  color: AppColors.txt1,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                contentPadding: EdgeInsets.only(
                                    bottom: 0, top: 0, left: 12.w, right: 10.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                  borderSide: BorderSide(
                                      color: AppColors.blueBa, width: 1.27.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                  borderSide: BorderSide(
                                      color: AppColors.blueBa, width: 1.27.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                  borderSide: BorderSide(
                                      color: AppColors.blueBa, width: 1.27.r),
                                ),
                              )
                          ),
                        ),
                        gapH(10.h),
                        threeOptionWidget(
                            title: "Para: ", content: selectedContact.isEmpty == false ? "${widget.messageData?.desNombre}, ${selectedContact['name'] ?? ""}" : "${widget.messageData?.desNombre}",
                            onTap: () async{
                              showUserSelectionDialog(context, contacts, 1);
                            }
                        ),
                        gapH(3.h),
                        threeOptionWidget(
                            title: "CC: ", content: selectedCCContact.isEmpty == false ? "${widget.messageData?.desNombreCc}, ${selectedCCContact['name'] ?? ""}" : "${widget.messageData?.desNombreCc}",
                            onTap: () async{
                              showUserSelectionDialog(context, contacts, 2);
                            }
                        ),
                        gapH(3.h),
                        threeOptionWidget(
                            title: "CC0: ",content: selectedCCOContact.isEmpty == false ? "${widget.messageData?.desNombreCco}, ${selectedCCOContact['name'] ?? ""}" : "${widget.messageData?.desNombreCco}",
                            onTap: () async {
                              showUserSelectionDialog(context, contacts, 3);
                            }
                        ),
                      ],),
                    ),
                    gapH(3.h),
                    Container(
                      width: double.infinity,
                      height: 370.h,
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.bgDc,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value){
                                msgController.text = value;
                                buildSendMessageRequest();
                              },
                              controller: msgController,
                              maxLines: null,
                              style: GoogleFonts.inter(
                                color: AppColors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              cursorHeight: 14.h,

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: 5.h, top: 5.h, left: 5.w, right: 5.w),
                                border: InputBorder.none,
                                hintMaxLines: null,
                                hintText: "Escribir Mensaje",
                                hintStyle: GoogleFonts.inter(
                                  color: AppColors.txt1,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: TextField(
                              enabled: false,
                              controller: msg2Controller,
                              maxLines: null,
                              style: GoogleFonts.inter(
                                color: AppColors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              cursorHeight: 14.h,

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: 5.h, top: 5.h, left: 5.w, right: 5.w),
                                border: InputBorder.none,
                                hintMaxLines: null,
                                hintText: "Escribir Mensaje",
                                hintStyle: GoogleFonts.inter(
                                  color: AppColors.txt1,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    gapH(3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Image.asset(AppAssets.attach, width: 29.w,
                            height: 29.h,
                            fit: BoxFit.contain,),
                          gapW(1.w),
                          GestureDetector(onTap: () {
                            filePicker();
                          },
                              child: SizedBox(child: txtB(
                                  file != null ? AppUtils.getLast10Characters(path.basename(file!.path)) : "Cargar archivo adjunto", 13.sp,
                                  textAlign: TextAlign.left))),
                        ],
                      ),
                    ),
                    gapH(10.h),
                  ],)
              ),
            ),
          ),
        );
      },
    );
  }

  Row threeOptionWidget(
      {required String title, required String content, required Function() onTap}) {
    return Row(children: [
      txtB(title, 15.sp),
      Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: txtR(content, 15.sp, weight: FontWeight.w500,
              textAlign: TextAlign.left))),
      gapW(20.w),
      GestureDetector(onTap: onTap,
          child: Image.asset(
            AppAssets.plus, width: 30.h, height: 30.h, fit: BoxFit.contain,)),
    ],);
  }

  void showUserSelectionDialog(BuildContext context,
      List<Contact> contacts, int type)  {
    Set<Contact> selectedContacts = {};

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.only(bottom: 100.h, left: 0, right: 0),
          alignment: Alignment.bottomCenter,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.35.r),
            side: BorderSide(color: AppColors.txt1, width: 3.5.r),
          ),
          elevation: 1.0,
          child: Container(
            height: 500.h,
            width: 358.w,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.35.r),
              color: AppColors.white,
              border: Border.all(color: AppColors.txt1, width: 3.5.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context, selectedContacts); // Return selection
                      },
                      child: Image.asset(
                        AppAssets.close,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ],
                ),
                gapH(10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: Contact
                        .groupContact(contacts)
                        .length,
                    itemBuilder: (context, index) {
                      return CollapsibleContactWidget(
                        contact: Contact.groupContact(contacts)[index],
                        onSelectionChanged: (selection) {
                          selectedContacts = selection;
                          setState(() {
                            switch (type){
                              case 1:
                                selectedContact =
                                    Contact.appendAllNombrecontactoAndCodigoContacto(selectedContacts.toList());
                              case 2:
                                selectedCCContact =
                                    Contact.appendAllNombrecontactoAndCodigoContacto(selectedContacts.toList());
                              case 3:
                                selectedCCOContact =
                                    Contact.appendAllNombrecontactoAndCodigoContacto(selectedContacts.toList());
                            }
                            buildSendMessageRequest();
                          });
                          //  cubit.resetState();
                          // Update selection
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void buildSendMessageRequest() {
    var request = SendMessageRequest(
        idColegio: AppConstant.userLoginResponse!.idColegio!,
        remidxMaestro:  AppConstant.userLoginResponse!.idxMaestro!.toInt(),
        remTipoMaestro:  AppConstant.userLoginResponse!.tipoMaestro!,
        remCedula:  AppConstant.userLoginResponse!.cedula!,
        remNombre:  AppConstant.userLoginResponse!.nombre!,
        respondeAidxMsg: widget.messageData!.idxMensaje!.toInt(),
        desidxMaestro: selectedContact.isEmpty == false ? "${widget.messageData?.desidxMaestro},${selectedContact['id'] ?? ""}" : "${widget.messageData?.desidxMaestro}",
        desNombre: selectedContact.isEmpty == false ? "${widget.messageData?.desNombre},${selectedContact['id'] ?? ""}" : "${widget.messageData?.desNombre}",
        desidxMaestroCc: selectedCCContact.isEmpty == false ? "${widget.messageData?.desidxMaestroCc},${selectedCCContact['id'] ?? ""}" : "${widget.messageData?.desidxMaestroCc}",
        desNombreCc: selectedCCContact.isEmpty == false ? "${widget.messageData?.desNombreCc}, ${selectedCCContact['name'] ?? ""}" : "${widget.messageData?.desNombreCc}",
        asunto: descriptionController.text,
        contenido: msgController.text,
        urgente: false,
        archivo: imageUploaded,
        adjunto: false,
        importante: false,
        paraApps: false,
        background: "",
        desidxMaestroCco: selectedCCOContact.isEmpty == false ? "${widget.messageData?.desIdxMaestroCco}, ${selectedCCOContact['id'] ?? ""}" : "${widget.messageData?.desIdxMaestroCco}",
        desNombreCco: selectedCCOContact.isEmpty == false ? "${widget.messageData?.desNombreCco}, ${selectedCCOContact['name'] ?? ""}" : "${widget.messageData?.desNombreCco}",
        fileName: AppUtils.getLast10Characters(path.basename(file?.path ?? "")),
        fileSize: fileSize.toString()
    );
    widget.onSelectionChanged(request);
  }
  filePicker() async {
    print("file picker");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
        compressionQuality: 50
    );
    if (result != null) {
      file = File(result.files.single.path ?? "");
      fileSize = await AppUtils.getFileSize(file!);
      _uploadFile();
    } else {
    }
    setState(() {
    });
  }
  Future<String> fileToBase64(File file) async {
    try {
      final fileBytes = await file.readAsBytes();
      final base64String = base64Encode(fileBytes);
      return base64String;
    } catch (e) {
      print("Error converting file to Base64: $e");
      return '';
    }
  }

  void _uploadFile() async {
    String base64 = await fileToBase64(file!);
    buildSendMessageRequest();
    cubit.postArchive(ArchiveRequest(
        idColegio: AppConstant.userLoginResponse!.idColegio!,
        idxMaestro: AppConstant.userLoginResponse!.idxMaestro!.toInt(),
        tipoMaestro: AppConstant.userLoginResponse!.tipoMaestro!,
        file: base64,
        fileName: AppUtils.getLast10Characters(path.basename(file!.path))
    ));
  }


}
