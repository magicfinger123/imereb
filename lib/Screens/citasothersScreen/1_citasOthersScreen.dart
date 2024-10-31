import 'package:bs_educativo/Screens/agendaScreen/2.0_agendaCalendarView.dart';
import 'package:bs_educativo/Screens/citasothersScreen/2.0_applicationView.dart';
import 'package:bs_educativo/Screens/citasothersScreen/2.1_citasCalendarView.dart';
import 'package:bs_educativo/Screens/citasothersScreen/2.2_citasRecordView.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apiService/api_service.dart';
import '../../utility/colors.dart';
import '../../utility/widgets.dart';
import '../2_main_menu_screen.dart';


class CitasOthersScreen extends StatefulWidget {
  const CitasOthersScreen({super.key});

  @override
  State<CitasOthersScreen> createState() => _CitasOthersScreenState();
}

class _CitasOthersScreenState extends State<CitasOthersScreen> {

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
          isAdmin: AppConstant.appUserType == "Admin",
          institution: AppConstant.collegeName ?? "",
          selectedUser: AppConstant.selectedMember?.nombreCompleto??"", group: group, counselor: counselor,
          userName: AppConstant.appUserType == "Admin"? AppConstant.userLoginResponse?.usuario??'':"",
          role: AppConstant.appUserType == "Admin"? 'Login: ${AppConstant.userLoginResponse?.nombre??''}':"",
          // selectUserTap: () {  },
          container:
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(width: 390.w,
                    decoration: deco(),
                    child: Column(
                      children: [
                        SizedBox(width: double.infinity,height: 60.h,
                          child: Stack(
                            clipBehavior: Clip.none, alignment: Alignment.topCenter,
                            children: [
                              Positioned(left: 241.w,
                                  child: GestureDetector(onTap: (){_onScreenSelected(2);},
                                      child: tapWidget("Historial",_currentIndex == 2))),
                              Positioned(left: 125.w,
                                  child: GestureDetector(onTap: (){_onScreenSelected(1);},
                                      child: tapWidget("Calendario",_currentIndex == 1))),
                              Positioned(left: 0.w,
                                  child: GestureDetector(onTap: (){_onScreenSelected(0);},
                                      child: tapWidget("Solicitud",_currentIndex == 0))),
                            ],
                          ),
                        ),
                            Expanded(
                              child: IndexedStack(
                                  index: _currentIndex, // Switch between screens
                                  children: [
                                    ApplicationView(onScreenChange:_onScreenSelected,),
                                    CitasCalendarView(onScreenChange:_onScreenSelected,),
                                    CitasRecordView(onScreenChange:_onScreenSelected,)
                                    //MessageTab(onScreenChange: _onScreenSelected),
                                  ] // Screens to switch between
                              ),
                            ),

                      ],
                    ),
                  ),
                ),
                gapH(10.h),
                backAndIcon((){
                  checkBackTap();
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

  Widget tapWidget(title,active) {
    return Container(color: Colors.white,
      child: Container(
                              width: 145.w,height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: active?AppColors.blueBa.withOpacity(0.25):AppColors.bgDc,
                                  border: Border.all(color: AppColors.blueBa,width: 2.5.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4.h,
                                        offset:  Offset(0, 2.h)
                                    )
                                  ]
                              ),
                              child: Center(child: txtB(title,15.sp)),
                            ),
    );
  }
  checkBackTap(){
    if(_currentIndex == 0){
      Navigator.pop(context);
    }else if(_currentIndex == 1){
      _onScreenSelected(0);
    }else if(_currentIndex == 2){
      _onScreenSelected(1);
    }
  }
}
