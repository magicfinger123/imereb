import 'package:bs_educativo/Screens/documentScreen/2.0_documentListView.dart';
import 'package:bs_educativo/Screens/documentScreen/2.1_documentDetailsView.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apiService/api_service.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  String? secondIcon;
  String? path;
  void _onScreenSelected(int index, {String? path}) {
    this.path = path;
    setState(() {
      _currentIndex = index;
    });

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
                        DocumentListView(onScreenChange: _onScreenSelected ),
                        DocumentDetailsScreen(onScreenChange:_onScreenSelected, path: path,)

                      ] // Screens to switch between
                  ),
                ),
                gapH(10.h),
                backAndIcon((){
                  _checkBackTap();
                }, () {},
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
