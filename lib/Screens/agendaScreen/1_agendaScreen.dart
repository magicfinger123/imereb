import 'package:bs_educativo/Screens/agendaScreen/2.0_agendaCalendarView.dart';
import 'package:bs_educativo/Screens/agendaScreen/2.1_agendaDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';


class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  String? secondIcon;
  void _onScreenSelected(int index) {
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
                        AgendaCalendarView(onScreenChange: _onScreenSelected),
                        AgendaDetailsView(onScreenChange: _onScreenSelected,)
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
