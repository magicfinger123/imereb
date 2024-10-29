import 'dart:async';

import 'package:bs_educativo/utility/demoInfos.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';



class DocumentDetailsScreen extends StatefulWidget {
  final Function(int) onScreenChange;
  final String? path;
  const DocumentDetailsScreen({super.key, required this.onScreenChange,  this.path});

  @override
  State<DocumentDetailsScreen> createState() => _DocumentDetailsScreenState();
}

class _DocumentDetailsScreenState extends State<DocumentDetailsScreen> {

  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: deco(),
      child: Column(children: [
        titleCard("Manual de Disciplina"),
        gapH(10.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: txtR("Manual de Disciplina",15.sp,
                      weight: FontWeight.w600,textAlign: TextAlign.left),
                ),
                gapH(20.h),
                // txtR(demoText,15.sp,
                //     weight: FontWeight.w400,textAlign: TextAlign.left,
                //     maxLines: 9000000000000000000),
                SizedBox(
                  height: 600,
                  child:
                  PDFView(
                    filePath: widget.path,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: true,
                    pageSnap: true,
                    defaultPage: currentPage!,
                    fitPolicy: FitPolicy.BOTH,
                    preventLinkNavigation:
                    false, // if set to true the link is handled in flutter
                    onRender: (_pages) {
                      setState(() {
                        pages = _pages;
                        isReady = true;
                      });
                    },
                    onError: (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                      print(error.toString());
                    },
                    onPageError: (page, error) {
                      setState(() {
                        errorMessage = '$page: ${error.toString()}';
                      });
                      print('$page: ${error.toString()}');
                    },
                    onViewCreated: (PDFViewController pdfViewController) {
                      _controller.complete(pdfViewController);
                    },
                    onLinkHandler: (String? uri) {
                      print('goto uri: $uri');
                    },
                    onPageChanged: (int? page, int? total) {
                      print('page change: $page/$total');
                      setState(() {
                        currentPage = page;
                      });
                    },
                  ),
                ),
                  // PDFView(
                  //   filePath: widget.path,
                  //   enableSwipe: true,
                  //   swipeHorizontal: true,
                  //   autoSpacing: false,
                  //   pageFling: false,
                  //   onRender: (_pages) {
                  //     setState(() {
                  //       pages = _pages;
                  //       isReady = true;
                  //     });
                  //   },
                  //   onError: (error) {
                  //     print(error.toString());
                  //   },
                  //   onPageError: (page, error) {
                  //     print('$page: ${error.toString()}');
                  //   },
                  //   onViewCreated: (PDFViewController pdfViewController) {
                  //     _controller.complete(pdfViewController);
                  //   },
                  //   onPageChanged: (int? page, int? total) {
                  //      print('page change: $page/$total');
                  //   },
                  // ),

              ],
            ),
          ),
        ),


      ],),
    );
  }
}
