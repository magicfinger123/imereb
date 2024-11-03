import 'package:bs_educativo/model/response/tips/tips.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apiService/api_service.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';
import '2.0_tipsListView.dart';
import '2.1_tipsDetailsView.dart';


class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  String? secondIcon;
  TipResponse? tips;
  void _onScreenSelected(int index, {TipResponse? tips}) {
    setState(() {
      _currentIndex = index;
    });
    this.tips = tips;
    if(_currentIndex == 0){
      secondIcon = null;
    }else if(_currentIndex == 1){
      secondIcon = AppAssets.share;
    }
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
        body: MenuDesign(
          isAdmin: AppConstant.appUserType == "Admin",
          institution: AppConstant.collegeName ?? "",
          selectedUser: AppConstant.selectedMember?.nombreCompleto??"",
          group: group, counselor: counselor,
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
                        TipListView(onScreenChange: _onScreenSelected),
                        TipsDetailsView(onScreenChange:_onScreenSelected, tipResponse: tips,)
                      ] // Screens to switch between
                  ),
                ),
                gapH(10.h),
                backAndIcon((){
                  _checkBackTap();
                },
                        ()
                    {

                    },
                    secondIcon,size: 61.0),
              ],
            ),
          ),
        ));
  }
  _checkBackTap(){
    if(_currentIndex == 0){
      Navigator.pop(context);
    }else if(_currentIndex == 1){
      _onScreenSelected(0);
    }
  }
  checkSecondBtnActions(){
    if(_currentIndex == 1){

    }
  }
}
