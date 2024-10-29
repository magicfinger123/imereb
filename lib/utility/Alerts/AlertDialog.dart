import 'package:bs_educativo/utility/colors.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomAlertDialog extends StatelessWidget {
  final String body;
  final String proceedText;
  final String declineText;
  final Function() proceed;
  final Function() decline;
  bool showIcon;
  CustomAlertDialog({
    required this.showIcon, 
    required this.body, 
    required this. proceedText, 
    required this.declineText, 
    required this.proceed, 
    required this.decline, 
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: showIcon ? 250 : 200,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          showIcon ? SizedBox(
            width: 50,
            height: 55,
            child: Center(child: Image.asset(AppAssets.finger, width: 50, height: 50, color: AppColors.primary,)),
          ) : gapH(1.0),
          gapH(20.0),
          ctmTxtAct(body,
              AppColors.black, 18.sp,maxLines: 2,textAlign: TextAlign.center, weight: FontWeight.w600),
          gapH(20.0),
          Row(
            children: [
              Expanded (
                child: blueBtn(proceedText,  proceed)
              ),
              gapW(10.0),
              Expanded (
                child: blueBtn( declineText, decline)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
