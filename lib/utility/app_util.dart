
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'colors.dart';

class AppUtils{
  static void debug(dynamic msg){
    if (kDebugMode) {
      print(msg);
    }
  }
  static Widget loadingWidget( {required bool isLoading, required Widget child}){
    return LoadingOverlay(
        isLoading: isLoading,
        color: Colors.transparent,
        progressIndicator: const CircularProgressIndicator(
          strokeWidth: 3.0,
          color: AppColors.primary,),
        child: child);
  }
  static void showErrSnack(String msg, BuildContext? context){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // MotionToast.error(
      //   toastDuration: const Duration(seconds: 3),
      //   layoutOrientation: ToastOrientation.ltr,
      //   displaySideBar: true,
      //   iconSize: 25.r,
      //   borderRadius: 16.r,
      //  // width: 300.w,
      //   height: 70.h,
      //   position: MotionToastPosition.top,
      //   animationType: AnimationType.fromLeft,
      //   description: customTextDms(msg, AppColors.textGrey2D, 16.sp,maxLines: 2),
      // ).show(context!);
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        showCloseIcon: true,
        backgroundColor: AppColors.redColor,
        content: Text(msg),
        duration: const Duration(seconds: 3),
      ));
    });
  }
  static void showErrSnack2(String msg, BuildContext? context){
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      showCloseIcon: true,
      backgroundColor: AppColors.redColor,
      content: Text(msg),
      duration: const Duration(seconds: 3),
    ));

  }
  static void showSuccessSnack(String msg, BuildContext? context){
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      showCloseIcon: true,
      backgroundColor: AppColors.primary,
      content: Text(msg),
      duration: const Duration(seconds: 7),
    ));

  }

  static String defaultErrorResponse({String? msg = "Error occurred"}){
    //var returnValue =  ApiResponse();
    // returnValue.result = Result();
    // returnValue.result!.message = msg;
    String returnValue = msg ?? "Error occurred";
    return returnValue;
  }


  static String customDateFormatter( inFormat, date, outFormat){
    var inputFormat = DateFormat(inFormat);
    var date1 = inputFormat.parse(date);
    var outputFormat = DateFormat(outFormat);
    var date2 = outputFormat.format(date1);
    print("ad: ${date2}");
    return date2;
  }

  static String convertDate(DateTime now) {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    final String formatted = formatter.format(now);
    return formatted;
  }
  static String getLast10Characters(String input) {
    // Ensure the string has at least 10 characters
    if (input.length <= 10) {
      return input; // Return the whole string if it's less than or equal to 10 characters
    }
    return input.substring(input.length - 10); // Get the last 10 characters
  }
  static String getDate(String isoDate, String outFormat) {
    DateTime dateTime = DateTime.parse(isoDate);
    DateFormat formatter = DateFormat(outFormat);
    return formatter.format(dateTime);
  }
 static Future<double> getFileSize(File file) async {
    if (await file.exists()) {
      final sizeInBytes = await file.length();
      final sizeInKB = sizeInBytes / 1024;
       return sizeInKB;
    } else {
      print('File does not exist.');
      return 0.0;
    }
  }
// static String? parseHtmlString(String htmlString) {
//   final document = parse(htmlString);
//   final String? parsedString = parse(document.body?.text).documentElement?.text;
//   return parsedString;
// }
// static String? parseHtml(String htmlString) {
//   final document = parse(htmlString);
//   final String? parsedString = parse(document.body?.text).documentElement?.outerHtml;
//   return parsedString;
// }
}