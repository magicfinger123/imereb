import 'dart:async';
import 'dart:io';

import 'package:bs_educativo/cubit/Document/document_cubit.dart';
import 'package:bs_educativo/model/request/DocumentRequest.dart';
import 'package:bs_educativo/model/response/document/DocumentResponse.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:bs_educativo/utility/demoInfos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path_provider/path_provider.dart';
import '../../utility/colors.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class DocumentListView extends StatefulWidget {
  final Function(int, {String? path}) onScreenChange;
  const DocumentListView({super.key, required this.onScreenChange});
  @override
  State<DocumentListView> createState() => _DocumentListViewState();
}

class _DocumentListViewState extends State<DocumentListView> {
  late DocumentCubit cubit;
  List<DocumentItem> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit = context.read<DocumentCubit>();
      cubit.fetchDocument(DocumentRequest(
          idColegio: (AppConstant.userLoginResponse!.idColegio!).toString(),
          cedula: AppConstant.userLoginResponse!.cedula!,
          userId: (AppConstant.userLoginResponse?.idxUsuario ?? 0).toString(),
          tipoMaestro: "F"//AppConstant.userLoginResponse?.tipoMaestro ?? ""
      )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentCubit, DocumentState>(
      builder: (context, state) {
        if (state is DocumentFetchedState){
          items = state.response;
        }
        return LoadingOverlay(
          isLoading: state is DocumentLoadingState,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.white,
                border: Border.all(color: AppColors.blueBa,width: 2.5.r)
            ),
            child: Column(children: [
              Container(width: double.infinity,height: 65.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                decoration: BoxDecoration(
                    color: AppColors.bgDc,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border(bottom: BorderSide(color: AppColors.border,width: 1.5.r)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ]
                ),
                child: Row(children: [
                  txtR("Documento",15.sp,weight: FontWeight.w600),
                  const Spacer(),
                  txtR("Fetcha",15.sp,weight: FontWeight.w600),
                ]),
              ),
              gapH(10.h),
              Expanded(
                child:
                ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
                    itemCount:items.length,
                    itemBuilder: (context, index) {
                      final doc = items[index];
                      return GestureDetector(onTap: (){
                        createFileOfPdfUrl(doc.urldir ?? "").then((f) {
                          if (f != null) {
                            setState(() {
                            widget.onScreenChange(1, path: f.path);
                          });
                          }
                        });
                       // widget.onScreenChange(1);
                      },
                        child: documentAndDates(
                            title:doc.descripcion??"",
                            date: doc.ano.toString()??""),
                      );
                    }
                ),
              ),
            ],),
          ),
        );
      },
    );
  }
  Future<File?> createFileOfPdfUrl(String path) async {
    if (path.isEmpty){
      AppUtils.showErrSnack("No file found", context);
      return null;
    }
    Completer<File> completer = Completer();
    print("Start download file from internet! $path");
    try {
      cubit.isLoading();
      final url = path;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");
      cubit.reset();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      cubit.reset();
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
