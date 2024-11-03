import 'package:bs_educativo/Screens/detailedRatingsScreen/2.0_mainRatingsView.dart';
import 'package:bs_educativo/Screens/detailedRatingsScreen/2.1_ratingsDetailsView.dart';
import 'package:bs_educativo/model/response/note/Boletin.dart';
import 'package:bs_educativo/model/response/note/Notas.dart';
import 'package:bs_educativo/model/response/note/NoteDetails.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apiService/api_service.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';



class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  Boletin? selectedNote;
  void _onScreenSelected(int index,{Boletin? selectedNote}) {
    this.selectedNote = selectedNote;
    setState(() {
      _currentIndex = index;
    });
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
                        MainRatingsView(onScreenChange: _onScreenSelected),
                        RatingsDetailView(onScreenChange: _onScreenSelected, note: selectedNote,)
                      ] // Screens to switch between
                  ),
                ),
                gapH(10.h),
                backAndIcon((){
                  _checkBackTap();
                }, ()
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
  }
  }
}
