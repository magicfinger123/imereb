import 'package:bs_educativo/utility/colors.dart';
import 'package:bs_educativo/utility/demoInfos.dart';
import 'package:bs_educativo/utility/iconsAndImages.dart';
import 'package:bs_educativo/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/text_widgets.dart';
class MessageTab extends StatefulWidget {
  final Function(int) onScreenChange;
  const MessageTab({super.key, required this.onScreenChange});

  @override
  _MessageTabState createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  int unreadMessages = 5; // Example count for unread messages
  String selectedCategory = 'Entrada'; // Default category
  final List<String> categories = ['Entrada', 'Salida','Eliminados', 'No leídos', 'Leídos'];
  bool _isDropdownVisible = false;
  String selectedMsgType = "Entrada";


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: AppColors.white,),
            child: Column(
              children: [
                Container(height: 70.h,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0.0, 5),
                      )],
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                        GestureDetector(
                            onTap: (){
                               setState(() {
                                 _isDropdownVisible = !_isDropdownVisible;
                               });
                            },
                            child: Image.asset(AppAssets.menu,width: 30.h,height: 30.h,fit: BoxFit.contain,)),
                        gapW(20.w),
                        Image.asset(AppAssets.message,width: 30.h,height: 30.h,fit: BoxFit.cover,),
                        gapW(20.w),
                        SizedBox(width: 205.w,height: 30.h,
                          child: TextField(

                            style: GoogleFonts.inter(
                              color: AppColors.txt1,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorHeight: 10.h,
                            cursorColor: AppColors.blueBa,
                            decoration: InputDecoration(
                              fillColor: AppColors.white,
                              filled: true,
                              hintText: "Buscar en Mensajería",
                              hintStyle: GoogleFonts.inter(
                                color: AppColors.txt1,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: EdgeInsets.only(bottom: 0,top: 0,left: 10.w,right: 10.w),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(color: AppColors.blueBa,width: 1.27.r),
                              ),
                          )
                          ),
                        ),


                      ],),
                      txtR(selectedMsgType,15.sp,weight: FontWeight.w600)
                    ],
                  ),

                ),
                gapH(10.h),
                Expanded(
                  child:ListView.builder(
                    padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                    itemCount: messageItems.length,
                    itemBuilder: (context, index) {
                    final msgs = messageItems?[index];
                    return  messageItemWidget(onTap:
                        (){
                          widget.onScreenChange(1);
                      },title:msgs?.title??'',
                      description: msgs?.description??'',date: msgs?.date??''
                      );}
                  ),
                ),
              ],
            ),
        ),
        Visibility(
          visible: _isDropdownVisible,
          child: Positioned(
              top: 80.h,
              left: 0,
              child: Container(
                width: 192.w,height: 247.h,
                decoration: BoxDecoration(color: AppColors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0.0, 4),
                      )],
                ),
                child: Column(children: [
                  msgDropListItemsWidget("Entrada",AppAssets.inbox,(){
                    setState(() {
                      selectedMsgType = "Entrada";
                      _isDropdownVisible = !_isDropdownVisible;
                    });
                  }),
                  msgDropListItemsWidget("Salida",AppAssets.send,(){
                    setState(() {
                      selectedMsgType = "Salida";
                      _isDropdownVisible = !_isDropdownVisible;
                    });
                  }),
                  msgDropListItemsWidget("Eliminados",AppAssets.trash,(){
                    setState(() {
                      selectedMsgType = "Eliminados";
                      _isDropdownVisible = !_isDropdownVisible;
                    });
                  }),
                  msgDropListItemsWidget("No leídos",AppAssets.inbox,(){
                    setState(() {
                      selectedMsgType = "No leídos";
                      _isDropdownVisible = !_isDropdownVisible;
                    });
                  }),
                  msgDropListItemsWidget("Leídos",AppAssets.openInbox,(){
                    setState(() {
                      selectedMsgType = "Leídos";
                      _isDropdownVisible = !_isDropdownVisible;
                    });
                  }),

                ],),
              )),
        ),
      ],
    );
  }




  // Function to return icons based on category
  Widget _getCategoryIcon(String category) {
    switch (category) {
      case 'Entrada':
        return Icon(Icons.inbox, color: Colors.blue);
      case 'Salida':
        return Icon(Icons.send, color: Colors.blue);
      case 'Eliminados':
        return Icon(Icons.delete, color: Colors.blue);
      case 'No leídos':
        return Icon(Icons.markunread, color: Colors.blue);
      case 'Leídos':
        return Icon(Icons.read_more, color: Colors.blue);
      default:
        return Icon(Icons.mail, color: Colors.blue);
    }
  }
}