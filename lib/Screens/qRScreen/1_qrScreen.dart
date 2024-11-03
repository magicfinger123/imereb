import 'package:bs_educativo/cubit/QR/qr_cubit.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../../apiService/api_service.dart';
import '../../utility/colors.dart';
import '../../utility/demoInfos.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';


class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}
class _QRScreenState extends State<QRScreen> {
  late QrCubit cubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      cubit.getQrS(GeneralRequest(idxestudiante: int.parse((AppConstant.selectedMember?.idxEstudiante).toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.read();
    return BgScaffold(
      body: BlocBuilder<QrCubit, QrState>(
  builder: (context, state) {
    return LoadingOverlay(
      isLoading: state is QrLoadingState,
      child: MenuDesign(
          isAdmin: AppConstant.appUserType == "Admin",
          institution: "",
        selectedUser: AppConstant.selectedMember?.nombreCompleto??"", group: group, counselor: counselor,
          userName: AppConstant.appUserType == "Admin"? AppConstant.userLoginResponse?.usuario??'':"",
          role: AppConstant.appUserType == "Admin"? 'Login: ${AppConstant.userLoginResponse?.nombre??''}':"",
         selectUserTap: () {
            cubit.getQrS(GeneralRequest(idxestudiante: int.parse((AppConstant.selectedMember?.idxEstudiante).toString())));
        },
        container:
        Expanded(child: Column(children: [
          Expanded(
            child: Container(width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: AppColors.white,
            border: Border.all(color: AppColors.border,width: 2.5.r)
            ),
                  child: SingleChildScrollView(child:Column(children: [
              gapH(40.h),
              txtR(AppConstant.selectedMember?.nombreCompleto ?? "",17.sp,weight: FontWeight.w600),
              txtR(AppConstant.selectedMember?.cedula ?? "",17.sp,weight: FontWeight.w400),
              if (cubit.qrItems.isNotEmpty)
              Image.memory(cubit.qrItems[0].getQRCodeImage()!)],)))
              ),
              gapH(20.h),
      
              backAndIcon((){
                Navigator.pop(context);
              },
                      (){
                        _shareQRCode();
                      },AppAssets.print),
            ],
          ),
        ),
      ),
    );
  },
));
  }
  Future<void> _shareQRCode() async {
    try {
      final qrValidationResult = QrValidator.validate(
        data: qrData,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L,
      );
      if (qrValidationResult.status == QrValidationStatus.valid) {
        final qrCode = qrValidationResult.qrCode!;
        final painter = QrPainter.withQr(
          qr: qrCode,
          color: const Color(0xFF000000),
          emptyColor: const Color(0xFFFFFFFF),
          gapless: true,
        );

        // Convert QR code to image
        final picData = await painter.toImageData(200, format: ui.ImageByteFormat.png);
        final buffer = picData!.buffer.asUint8List();

        // Save the image temporarily to share
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/qr_code.png';
        final file = await File(filePath).writeAsBytes(buffer);

        // Share the image using ShareXFiles
        XFile xFile = XFile(file.path);
        await Share.shareXFiles([xFile], text: 'QR Code for James Watts: 8-888-8888');
      }
    } catch (e) {
      print('Error sharing QR code: $e');
    }
  }


}
