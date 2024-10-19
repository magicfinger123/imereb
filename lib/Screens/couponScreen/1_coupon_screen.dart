import 'package:bs_educativo/Screens/couponScreen/2.0_couponGroupList.dart';
import 'package:bs_educativo/Screens/couponScreen/2.1_SelectedCouponTypeView.dart';
import 'package:bs_educativo/Screens/couponScreen/2.2_selectedCouponDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apiService/api_service.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {

  void _onScreenSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
        body: MenuDesign(
          institution: "Colegio Internacional de Panamá",
          selectedUser: selectedMember?.nombreCompleto??"", group: group, counselor: counselor,
          selectUserTap: () {  },
          container:
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                      index: _currentIndex, // Switch between screens
                      children: [
                        CouponGroupListView(onScreenChange: _onScreenSelected),
                        SelectedCouponTypeView(onScreenChange:_onScreenSelected),
                        SelectedCouponDetailsView(onScreenChange: _onScreenSelected)
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
                    null,size: 61.0),
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
    }else if(_currentIndex == 2){
  _onScreenSelected(1);
  }
  }
}
