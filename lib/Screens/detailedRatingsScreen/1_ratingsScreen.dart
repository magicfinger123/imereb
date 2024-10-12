import 'package:bs_educativo/Screens/detailedRatingsScreen/2.0_mainRatingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';



class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  void _onScreenSelected(int index) {
    setState(() {
      _currentIndex = index;

      // if(_currentIndex == 0){
      //   secondIcon = AppAssets.compose;
      // }else if(_currentIndex == 1){
      //   secondIcon = AppAssets.trash;
      // }else if(_currentIndex == 2){
      //   secondIcon = AppAssets.send;
      // }
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BgScaffold(
        body: MenuDesign(
          institution: "Colegio Internacional de Panamá",
          selectedUser: selectedUser, group: group, counselor: counselor,
          selectUserTap: () {  },
          container:
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                      index: _currentIndex, // Switch between screens
                      children: [
                        MainRatingsView(onScreenChange: _onScreenSelected),
                        Container()
                      ] // Screens to switch between
                  ),
                ),
                gapH(10.h),
                backAndIcon((){
                      Navigator.pop(context);
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
}
