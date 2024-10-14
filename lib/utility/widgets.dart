import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'demoInfos.dart';
import 'iconsAndImages.dart';

class BgScaffold extends StatelessWidget {
  final Widget body;
  const BgScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xFFF7F7F7),
            image: DecorationImage(
                image: AssetImage(AppAssets.bg), fit: BoxFit.cover)),
        child: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: body,
            )),
      )),
    );
  }
}

class CtmTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title, iconTxt;
  const CtmTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.iconTxt});

  @override
  State<CtmTextField> createState() => _CtmTextFieldState();
}

class _CtmTextFieldState extends State<CtmTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.iconTxt,
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.fitHeight,
                ),
                gapW(10.w),
                txtR(widget.title, 17.9.sp),
              ],
            ),
            gapH(15.h),
            SizedBox(
                width: 280.w,
                height: 42.h,
                child: TextField(
                  controller: widget.controller,
                  cursorHeight: 15.sp,
                  cursorColor: AppColors.border,
                  style: GoogleFonts.inter(
                    color: AppColors.txt1,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: AppColors.d9,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                        bottom: 0, top: 0, left: 10.w, right: 10.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide:
                          BorderSide(color: AppColors.border, width: 1.27.r),
                    ),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

Container topLogoAndTxt() {
  return Container(
    height: 180.h,
    child: Stack(
      children: [
        Image.asset(
          AppAssets.logo1,
          width: 200.w,
          height: 180.h,
          fit: BoxFit.cover,
        ),
        Positioned(top: 140.h, child: txtB("BS Educativo", 30.sp)),
      ],
    ),
  );
}

Container topLogoAndTxt2() {
  return Container(
    child: Column(
      children: [
        Image.asset(
          AppAssets.logoSmall,
          width: 150.w,
          height: 100.h,
          fit: BoxFit.cover,
        ),
        txtB("BS Educativo", 20.sp),
      ],
    ),
  );
}

Container topLogoAndTxt3() {
  return Container(
    child: Column(
      children: [
        Image.asset(
          AppAssets.bios,
          width: 150.w,
          height: 37.h,
          fit: BoxFit.contain,
        ),
        gapH(15.h),
        txtB("BS Educativo", 20.sp),
      ],
    ),
  );
}

SizedBox gapH(height) => SizedBox(
      height: height,
    );
SizedBox gapW(width) => SizedBox(
      width: width,
    );

Row fingerWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        AppAssets.finger,
        width: 25.w,
        height: 25.h,
        fit: BoxFit.contain,
      ),
      gapW(10.w),
      txtR("Activar", 17.sp),
      txtB(" Biométrico.", 17.sp)
    ],
  );
}

Center blueBtn(title, onTap) {
  return Center(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
          width: 182.w,
          height: 42.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.3.r),
              color: AppColors.blueBa,
              boxShadow: [
                BoxShadow(
                    color: AppColors.blueBa,
                    blurRadius: 0.5.r,
                    spreadRadius: 0,
                    offset: Offset(0, -4)),
                BoxShadow(
                    color: AppColors.black.withOpacity(0.24),
                    blurRadius: 4.r,
                    spreadRadius: 0,
                    offset: Offset(0, -4))
              ]),
          child: Center(child: txtB(title, 20.sp, color: AppColors.white))),
    ),
  );
}

Column menuItems(
    {required Function() qrTap,
    required Function() messageTap,
    required Function() threetap,
    required Function() fourTap,
    required Function() calendarTap,
    required Function() clockTap,
    required Function() documentTap,
    required Function() matricTap,
    required Function() alertTap,
    required Function() tipsTap,
    required Function() couponTap}) {
  return Column(
    children: [
      Row(
        children: [
          menuListItem("QR", AppAssets.qr, qrTap),
          const Spacer(),
          menuListItem("Mensajería", AppAssets.mail, messageTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Calificaciones", AppAssets.playList, threetap),
          const Spacer(),
          menuListItem("EC", AppAssets.dollar, fourTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Agenda", AppAssets.calendar, calendarTap),
          const Spacer(),
          menuListItem("Citas", AppAssets.clock, clockTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Documentos", AppAssets.book, documentTap),
          const Spacer(),
          menuListItem("Matrícula", AppAssets.matric, matricTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Alertas", AppAssets.bell, alertTap),
          const Spacer(),
          menuListItem("Tips", AppAssets.pointer, tipsTap)
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Cupones", AppAssets.tag, couponTap),
          const Spacer(),
        ],
      ),
      gapH(40.h),
    ],
  );
}

SizedBox sp() => gapH(10.h);

Widget menuListItem(title, icon, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Image.asset(
          icon,
          width: 60.w,
          height: 60.h,
        ),
        SizedBox(
            width: 125.w,
            child: Center(child: txtR(title, 17.sp, weight: FontWeight.w600)))
      ],
    ),
  );
}

class MenuDesign extends StatefulWidget {
  final Widget container;
  final String institution, selectedUser, group, counselor;
  final Function() selectUserTap;
  final bool isBiosLogo;

  const MenuDesign({
    super.key,
    required this.container,
    required this.selectedUser,
    required this.group,
    required this.counselor,
    required this.selectUserTap,
    this.isBiosLogo = true,
    required this.institution,
  });

  @override
  State<MenuDesign> createState() => _MenuDesignState();
}

class _MenuDesignState extends State<MenuDesign> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH(10.h),
        Row(
          children: [
            Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: AppColors.blueBa,
                  shape: BoxShape.circle,
                  // border: Border.all(color: AppColors.blueBa,width: 4.r)
                ),
                child: Center(
                  child: Container(
                    width: 66.w,
                    height: 66.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage(AppAssets.boy)),
                      // border: Border.all(color: AppColors.blueBa,width: 4.r)
                    ),
                  ),
                )),
            const Spacer(),
            widget.isBiosLogo ? topLogoAndTxt3() : topLogoAndTxt2(),
          ],
        ),
        gapH(10.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            txtB(widget.institution, 20.sp),
            sp(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.selectUserTap,
                  child: Container(
                      width: 144.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.4.r),
                          border: Border.all(
                              color: AppColors.blueBa, width: 1.27.r)),
                      child: Row(children: [
                        gapW(5.w),
                        Expanded(
                            child: txtR(widget.selectedUser, 16.sp,
                                weight: FontWeight.w600)),
                        gapW(5.w),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 25.sp,
                          color: AppColors.blueBa,
                        )
                      ])),
                ),
                gapW(30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        txtR("Grupo: ", 15.sp, weight: FontWeight.w600),
                        txtR(widget.group, 15.sp)
                      ],
                    ),
                    Row(
                      children: [
                        txtR("Consejero: ", 15.sp, weight: FontWeight.w600),
                        txtR(widget.counselor, 15.sp)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        gapH(10.h),
        widget.container,
        gapH(5.h),
      ],
    );
  }
}

Padding backAndIcon(backTap, iconTap, icon, {double size = 48}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
    child: Row(
      children: [
        GestureDetector(
            onTap: backTap,
            child: Icon(
              Icons.arrow_back,
              color: AppColors.black00,
              size: 45.r,
            )),
        const Spacer(),
        icon != null
            ? GestureDetector(
                onTap: iconTap,
                child: Image.asset(
                  icon,
                  width: size.h,
                  height: size.h,
                  fit: BoxFit.fitHeight,
                ))
            : SizedBox(),
      ],
    ),
  );
}

Widget msgDropListItemsWidget(title, icon, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 25.w,
            height: 24.h,
            fit: BoxFit.contain,
          ),
          gapW(10.w),
          txtR(title, 15.sp),
        ],
      ),
    ),
  );
}

Widget messageItemWidget(
    {required Function() onTap,
    required String title,
    required String description,
    required String date}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 15.h, left: 16.w, right: 16.w),
      child: Row(
        children: [
          Image.asset(
            AppAssets.profile,
            width: 20.h,
            height: 20.h,
            fit: BoxFit.contain,
          ),
          gapW(20.w),
          SizedBox(
            width: 220.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txtB(title, 12.sp),
                txtR(description, 12.sp),
              ],
            ),
          ),
          const Spacer(),
          txtB(date, 12.sp, textAlign: TextAlign.end),
        ],
      ),
    ),
  );
}

Widget subjectAndRatingItemWidget(
    {required String subject, required String rating}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(child: txtR(subject, 15.sp, weight: FontWeight.w600)),
          gapW(20.w),
          txtB(rating, 15.sp,
              weight: FontWeight.w500,
              color: Colors.green,
              textAlign: TextAlign.left),
        ],
      ),
      gapH(10.h),
      Divider(
        color: AppColors.black.withOpacity(0.25),
        thickness: 1.25,
      ),
    ],
  );
}

Widget documentAndDates({required String title, required String date}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(child: txtR(title, 15.sp, weight: FontWeight.w600)),
          gapW(20.w),
          Container(
              width: 120.w,
              child: txtB(date, 15.sp,
                  weight: FontWeight.w400, textAlign: TextAlign.left)),
        ],
      ),
      gapH(10.h),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(
          color: AppColors.black.withOpacity(0.25),
          thickness: 1.25,
        ),
      ),
    ],
  );
}

Widget finEcWidget(
    {required String title,
    required String amount,
    isCredit = true,
    required Function() onIconTap}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200.w, child: txtR(title, 15.sp, weight: FontWeight.w600)),
          const Spacer(),
          SizedBox(
              width: 90.w,
              child: txtB(amount, 15.sp,
                  weight: FontWeight.w500,
                  color: isCredit ? null : const Color(0xFF950707),
                  textAlign: TextAlign.right)),
          GestureDetector(
              onTap: onIconTap,
              child: Image.asset(
                AppAssets.info,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.contain,
              ))
        ],
      ),
      gapH(10.h),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(
          color: AppColors.black.withOpacity(0.25),
          thickness: 1.25,
        ),
      ),
    ],
  );
}

Widget alertWidget(
    {required String title,
    required String amount,
    required Function() onIconTap}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200.w, child: txtR(title, 15.sp, weight: FontWeight.w600)),
          const Spacer(),
          SizedBox(
              width: 90.w,
              child: txtB(amount, 15.sp,
                  weight: FontWeight.w500, textAlign: TextAlign.right)),
          GestureDetector(onTap: onIconTap,
              child: Image.asset(AppAssets.info,width: 30.w,height: 30.h,fit: BoxFit.contain,))
        ],
      ),
      gapH(10.h),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(
          color: AppColors.black.withOpacity(0.25),
          thickness: 1.25,
        ),
      ),
    ],
  );
}

void showUserSelectionDialog(BuildContext context, List<Category> categories) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.only(bottom: 100.h),
        alignment: Alignment.bottomCenter,
        backgroundColor: AppColors.white,
        elevation: 1.0,
        child: Container(
          height: 500.h,
          width: 358.w,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.3.r),
            color: AppColors.white,
            border: Border.all(color: AppColors.txt1, width: 3.5.r),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CollapsibleCategoryWidget(
                      category: categories[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


class CollapsibleCategoryWidget extends StatefulWidget {
  final Category category;

  CollapsibleCategoryWidget({required this.category});

  @override
  _CollapsibleCategoryWidgetState createState() => _CollapsibleCategoryWidgetState();
}

class _CollapsibleCategoryWidgetState extends State<CollapsibleCategoryWidget> {
  bool _isExpanded = false;
  List<bool> _selectedUsers = [];

  @override
  void initState() {
    super.initState();
    _selectedUsers = List<bool>.filled(widget.category.users.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 13.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blueBa, width: 2.5.r),
        borderRadius: BorderRadius.circular(6.3.r),
        color: AppColors.bgDc,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4.h,
            offset: Offset(0, 4.h),
          )
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.category.categoryName, style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.blueBa,
                  size: 30.r,
                )
              ],
            ),
          ),
          if (_isExpanded)
            Container(height: 150.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                //shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: widget.category.users.length,
                itemBuilder: (context, index) {
                  return _selectUserWidget(
                    userName: widget.category.users[index].name,
                    isSelected: _selectedUsers[index],
                    onTap: () {
                      setState(() {
                        _selectedUsers[index] = !_selectedUsers[index];
                      });
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _selectUserWidget({required String userName, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(margin: EdgeInsets.only(bottom: 10.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.profile,width: 20.h,height: 20.h,fit: BoxFit.contain,), // Replace with your custom asset
            gapW(10.w),
            Expanded(child: txtR(userName,15.sp, weight: FontWeight.w400)),
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.black, width: 1.5.r),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 7.w,
                  height: 7.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black,
                  ),
                ),
              )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

Row reToWidget({required String recipientName,required Function()addTap,required Function()refreshTap}) {
  return Row(children: [
    txtB("Solicitar a: ",17.sp,weight: FontWeight.w700),
    gapW(5.w),
    GestureDetector(onTap: addTap,
      child: Image.asset(AppAssets.plus,
        width: 25.w,height: 28.h,fit: BoxFit.fitWidth,),
    ),
    gapW(5.w),
    recipientName.isEmpty? SizedBox():
    Image.asset(AppAssets.profile,
      width: 25.w,height: 24.h,
      fit: BoxFit.contain,
      color: AppColors.black.withOpacity(0.95),),
    gapW(10.w),
    Expanded(
        child: txtR(recipientName, 15.sp,weight: FontWeight.w400)),
    gapW(5.w),
    recipientName.isEmpty? SizedBox():
    GestureDetector(onTap: refreshTap,
      child: Image.asset(AppAssets.refresh,
        width: 25.w,height: 24.h,
        fit: BoxFit.cover,),
    ),
  ],);
}

Container requestInputField(controller) {
  return Container(
    height: 300.h,
    width: double.infinity,
    decoration: decoCard(),
    child: TextField(
      controller: controller,
      cursorHeight: 15.sp,
      cursorColor: AppColors.txt1,
      style: GoogleFonts.inter(
          color: AppColors.txt1,fontSize: 15.sp,fontWeight: FontWeight.w400),
      maxLength: null,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 16.h),
      ),
    ),
  );
}

GestureDetector smallBtn({required Function()onTap,required String title,bool active = true

}) {
  return GestureDetector(onTap: onTap,
    child: Container(width: 116.w,height: 39.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
          border: Border.all(color: AppColors.blueBa,width: 1.25.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4.h,
                offset:  Offset(0, 4.h)
            )
          ]
      ),
      child: Center(child: txtR(title,
          17.sp,weight: FontWeight.w600,
          color: active? AppColors.txt1:
          AppColors.txt1.withOpacity(0.5)
      ),),
    ),
  );
}

BoxDecoration decoCard() {
  return BoxDecoration(
      border: Border.all(color: AppColors.blueBa,width: 1.27.r),
      borderRadius: BorderRadius.circular(6.35.r),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4.h,
            offset:  Offset(0, 4.h)
        )
      ]
  );
}
Container agendaMarkCircle() {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    width: 40.w,
    height: 40.w,
    decoration: BoxDecoration(
      border: Border.all(
          color: AppColors.blueBa,
          width: 1.r// Marker border color
      ),
      color: AppColors.blueBa.withOpacity(0.20), // Marker color
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    // child: Text(
    //   date.day.toString(),
    //   style: const TextStyle(
    //     color: Colors.black, // Text color for days with events
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );
}

Container commentPopWidget({required String title,required String date,required String comment}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal:10.w,vertical: 10.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.blueBa,width: 1.5.r)
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txtB(title,14.sp,),
        gapH(10.h),
        txtR(date,14.sp,),
        gapH(10.h),
        txtR(comment,14.sp,maxLines: 3),


      ],),);
}
// void showUserSelectionDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         insetPadding: EdgeInsets.only(bottom: 100.h),
//         alignment: Alignment.bottomCenter,
//         backgroundColor: AppColors.white,
//         elevation: 1.0,
//         child: Container(
//           height: 500.h,
//           width: 358.w,
//           padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.3.r),
//             color: AppColors.white,
//             border: Border.all(color: AppColors.txt1,width: 3.5.r)
//           ),
//           child: Column(
//             children: [
//               colapseableWidget(),
//              ]
//           ),
//         ),
//       );
//     },
//   );
// }
//
// class colapseableWidget extends StatefulWidget {
//   const colapseableWidget({
//     super.key,
//   });
//
//   @override
//   State<colapseableWidget> createState() => _colapseableWidgetState();
// }
//
// class _colapseableWidgetState extends State<colapseableWidget> {
//   bool _isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: !_isExpanded?45.h:214.h,width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 13.w,),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.blueBa,width: 2.5.r),
//         borderRadius: BorderRadius.circular(6.3.r),
//         color: AppColors.bgDc,
//         boxShadow: [
//           BoxShadow(
//               color: AppColors.black.withOpacity(0.25),
//               spreadRadius: 0,
//               blurRadius: 4.h,
//               offset:  Offset(0, 4.h)
//           )
//         ]
//       ),
//       child: _isExpanded?
//       Column(children: [
//         gapH(10.h),
//         GestureDetector(onTap: (){
//           setState(() {
//             _isExpanded = !_isExpanded;
//           });
//         },
//           child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               txtB("Category",15.sp),
//               const Spacer(),
//               Icon(Icons.keyboard_arrow_down,color: AppColors.blueBa,size: 30.r,)
//             ],),
//         ),
//         gapH(10.h),
//           Expanded(
//             child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: categories.length,
//             itemBuilder: (context, categoryIndex) {
//               final user = categories[categoryIndex];
//               return selectUserWidget(
//                   title: user.categoryName,
//                   isSelected: false
//               );
//             }),
//           )
//       ]):
//       GestureDetector(onTap: (){
//         setState(() {
//           _isExpanded = !_isExpanded;
//         });
//       },
//         child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//           txtB("title",15.sp),
//           const Spacer(),
//           Icon(Icons.keyboard_arrow_down,color: AppColors.blueBa,size: 30.r,)
//         ],),
//       ),
//
//     );
//   }
//
//   Row selectUserWidget({required String title,required bool isSelected}) {
//     return Row(children: [
//           Image.asset(AppAssets.profile,width: 20.h,height: 20.h,),
//           gapW(10.w),
//           Expanded(child: txtB(title,15.sp)),
//           Container(
//             width: 15.w,height: 15.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.black,width: 1.5.r),
//             ),
//             child: isSelected?Center(
//               child: Container(width: 7.w,height: 7.w,decoration: BoxDecoration(
//                 shape: BoxShape.circle,color: AppColors.black
//               ),),
//             ):SizedBox()
//           )
//
//         ],);
//   }
// }


