import 'package:bs_educativo/cubit/Message/message_cubit.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../utility/colors.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class MessageView extends StatefulWidget {
  final Function(int) onScreenChange;
  final MessageData? messageData;
  final List<MsgAttachment> attachment;
  const MessageView({required this.messageData, super.key, required this.onScreenChange, required this.attachment});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> with WidgetsBindingObserver {
  late MessageCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    cubit = context.read();
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if (state is AttachmentDownloadedState){
          WidgetsBinding.instance.addPostFrameCallback((_){
            if (state.response == true){
              AppUtils.showSuccessSnack("Attachment saved to files", context);
            }else{
              AppUtils.showErrSnack("Unable to save attachment", context);
            }
            cubit.resetState();
          });
        }
        return LoadingOverlay(
          isLoading: state is MessageLoading,
          child: Container(height: 600.h,width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.white,
                border: Border.all(color: AppColors.border,width: 2.5.r)
            ),
            child: SingleChildScrollView(
              child: messageViewWidget(
                title: widget.messageData?.asunto ?? "",
                sender: widget.messageData?.remNombre ?? "",
                toAddresses: widget.messageData?.desNombre ?? "",
                copiedAddresses: widget.messageData?.desNombreCc ?? "",
                message: widget.messageData?.contenido ?? "",
                fileTitle: widget.attachment.isEmpty ? "" : widget.attachment[0].fileName ?? "",
                replyAllTap: (){
                  widget.onScreenChange(3);
                },
                replyLeftTap: (){
                  widget.onScreenChange(3);
                },
                replyRightTap: (){
                  widget.onScreenChange(3);
                },
                fileTap: (){
                  if(widget.attachment.isNotEmpty){
                    cubit.downloadAttachment(widget.attachment[0].url ?? "", widget.attachment[0].fileName ?? "");
                  }
                  AppUtils.showSuccessSnack("Descargando archivo adjunto", context);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget messageViewWidget({
    required String title,
    required String sender,
    required String toAddresses,
    required String copiedAddresses,
    required String message,
    required String fileTitle,
    required Function()replyAllTap,
    required Function()replyLeftTap,
    required Function()replyRightTap,
    required Function()fileTap,

  }) {
    return Column(
        children: [
          Row(
            children: [
              SizedBox(width: 220.w,
                child: txtR(title,15.sp,weight: FontWeight.w600,textAlign: TextAlign.left),),
              const Spacer(),
              GestureDetector(onTap: replyAllTap,
                  child: Image.asset(AppAssets.replyAll,width: 31.w,height: 25.h,fit: BoxFit.cover,)),
              gapW(20.h),
              GestureDetector(onTap: replyLeftTap,
                  child: Image.asset(AppAssets.replyLeft,width: 25.w,height: 25.h,fit: BoxFit.cover,)),
              gapW(20.h),
              GestureDetector(onTap: replyRightTap,
                  child: Image.asset(AppAssets.replyRight,width: 25.w,height: 25.h,fit: BoxFit.cover,)),
            ],
          ),
          gapH(16.h),
          Row(
            children: [
              Image.asset(AppAssets.profile,width: 18.w,height: 18.h,fit: BoxFit.contain,),
              gapW(10.h),
              Expanded(child: txtB(sender,13.sp,textAlign: TextAlign.left)),
            ],
          ),
          gapH(14.h),
          Row(children: [
            txtB("Para: ",15.sp,textAlign: TextAlign.left),
            Expanded(child: txtR(toAddresses,15.sp,textAlign: TextAlign.left)),
          ],),
          gapH(10.h),
          Row(children: [
            txtB("CC: ",15.sp,textAlign: TextAlign.left),
            Expanded(child: txtR(copiedAddresses,15.sp,textAlign: TextAlign.left)),
          ],),
          gapH(15.h),
          Container(width: double.infinity,height: 350.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.bgDc,
                  border: Border.all(color: AppColors.txt1,width: 1.5.r)
              ),
              child: SingleChildScrollView(
                  child: txtR(parseHtmlString(message),15.sp,
                      textAlign: TextAlign.left,color: AppColors.black,
                      maxLines: 1000000000000000000))),
          gapH(10.h),
          Row(
            children: [
              Image.asset(AppAssets.attach,width: 29.w,height: 29.h,fit: BoxFit.contain,),
              gapW(1.w),
              GestureDetector(onTap: fileTap,
                  child:SizedBox(
                      child:
                      txtB(fileTitle,13.sp,textAlign: TextAlign.left)
                  )
              ),
            ],
          ),
          gapH(2.h),
        ]
    );
  }
  String parseHtmlString(String htmlString) {
    dom.Document document = html_parser.parse(htmlString);
    return document.body?.text ?? ''; // Extracts text content
  }

  Future<void> downloadFile(String url, String fileName) async {
    try {
      // Send HTTP GET request to the URL
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Get the directory to save the file
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        // Save the file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        print('File downloaded and saved to $filePath');
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}
