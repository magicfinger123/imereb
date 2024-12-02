import 'package:bs_educativo/model/response/Alert/Alert.dart';
import 'package:bs_educativo/model/response/EC/PaymentData.dart';
import 'package:bs_educativo/model/response/meet/MeetEliglibleList.dart';
import 'package:bs_educativo/model/response/message/ContactList.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:bs_educativo/utility/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../model/response/LoginResponse.dart';
import 'AppConstant.dart';
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
  bool? isPassword = false;
  CtmTextField(
      {super.key, this.isPassword,
        required this.controller,
        required this.title,
        required this.iconTxt});

  @override
  State<CtmTextField> createState() => _CtmTextFieldState();
}

class _CtmTextFieldState extends State<CtmTextField> {
  bool hidePassword = true;
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
                obscureText: widget.isPassword == true && hidePassword,
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
                  suffixIcon: widget.isPassword == true ? IconButton(
                    icon: Icon(hidePassword? Icons.visibility: Icons.visibility_off),onPressed: () {
                    setState(
                          () {
                        hidePassword = !hidePassword;
                        });
                    }) : const SizedBox(),alignLabelWithHint: false,
                ),
              ),
            )
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
          AppAssets.logo1,
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
Future<dynamic> openBottomSheet2( BuildContext context,Widget bottomScreen, {bool? isDismissible}) {
  return showModalBottomSheet(
      isDismissible: isDismissible ?? true,
      isScrollControlled: true,
      context: context,
      enableDrag: isDismissible ?? true,
      backgroundColor: AppColors.white,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),topLeft: Radius.circular(12.r)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child:  bottomScreen,
      )
  );
}
Text ctmTxtAct(title,
    color,size,
    {weight = FontWeight.normal,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style:
    TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'actionSansRegular',
        fontWeight: weight,
        letterSpacing: -0.25.sp
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
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
          // menuListItem("Matrícula", AppAssets.matric, matricTap),
          menuListItem("Alertas", AppAssets.bell, alertTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Tips", AppAssets.pointer, tipsTap),
          const Spacer(),
          menuListItem("Cupones", AppAssets.tag, couponTap),
        ],
      ),
      // sp(),
      // Row(
      //   children: [
      //
      //     const Spacer(),
      //   ],
      // ),
      gapH(40.h),
    ],
  );
}

Column menuItemsAdmin(
    {required Function() qrTap,
      required Function() messageTap,
      required Function() threetap,
      required Function() fourTap,
      required Function() agenderTap,
      required Function() clockTap,
      required Function() documentTap,
      required Function() califioriTap,
      required Function() alertTap,
      required Function() tipsTap,
      required Function() couponTap,
      required Function() estatusTap,
    }) {
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
          menuListItem("Reportes", AppAssets.playList, threetap),
          const Spacer(),
          menuListItem("Supervisar Mensajería", AppAssets.supervisor, fourTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Agenda", AppAssets.calendar, agenderTap),
          const Spacer(),
          menuListItem("Citas", AppAssets.clock, clockTap),
        ],
      ),
      sp(),
      Row(
        children: [
          menuListItem("Documentos", AppAssets.book, documentTap),
          const Spacer(),
          menuListItem("Calificaciones", AppAssets.califiori, califioriTap),
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
          menuListItem("Estatus Libretas", AppAssets.estatus, estatusTap),
          const Spacer(),
          menuListItem("Cupones", AppAssets.tag, couponTap),
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


Widget menuListItem2(title, icon, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Image.network(
          icon,
          width: 150.w,
          height: 100.h,
          fit: BoxFit.fitHeight,
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
  final bool isAdmin;
  final String? userName;
  final String? role;


  const MenuDesign({
    super.key,
    required this.container,
    required this.selectedUser,
    required this.group,
    required this.counselor,
    required this.selectUserTap,
    this.isBiosLogo = false,
    required this.institution,
    this.isAdmin = false,
    this.userName = "",
    this.role = "",
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
                decoration: const BoxDecoration(
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
                      image:  DecorationImage(
                          image: NetworkImage(AppConstant.userLoginResponse?.imagenUrl ?? "")),
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
            widget.isAdmin
                ? Row(children: [
              SizedBox(width: 250.w,
                  child:
                  txtR(widget.userName, 18.sp,weight: FontWeight.w600)),
              gapW(10.w),
              txtR(widget.role, 15.sp,weight: FontWeight.w600),
            ],):
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    _selectStudent(context);
                  },
                  child: Container(
                      width: 154.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.4.r),
                          border: Border.all(
                              color: AppColors.blueBa, width: 1.27.r)),
                      child: Row(children: [
                        gapW(5.w),
                        Expanded(
                            child: txtR(widget.selectedUser, 13.sp,
                                weight: FontWeight.w600,maxLines: 2)),
                        gapW(1.w),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20.sp,
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
                        txtR(AppConstant.userLoginResponse?.grupo.toString(), 15.sp)
                      ],
                    ),
                    Row(
                      children: [
                        txtR("Consejero: ", 15.sp, weight: FontWeight.w600),
                        txtR(AppConstant.userLoginResponse?.consejero.toString(), 15.sp)
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
  _selectStudent(BuildContext context)async{
    if(AppConstant.userLoginResponse?.familyMembers != null){
      var result =  await showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child:  SelectFamilyMemberBottomSheet(userFamilyMembers: AppConstant.userLoginResponse?.familyMembers??[],),
          )
      );
      if(result is FamilyMember){
        setState(() {
          AppConstant.selectedMember = result;
          widget.selectUserTap();
        });
      }
    }
  }
}

Padding backAndIcon(backTap, iconTap, icon, {double size = 48}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
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
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
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
    ),
  );
}

Widget messageItemWidget(
    {
      required Function() onTap,
      required String title,
      required String description,
      required bool isRead,
      required String date
    }){
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
                txtB(title, 12.sp, color: isRead ? AppColors.txt1.withOpacity(0.5) : AppColors.txt1),
                txtR(description, 12.sp, color: isRead ? AppColors.txt1.withOpacity(0.5) : AppColors.txt1),
              ],
            ),
          ),
          const Spacer(),
          txtB(date, 12.sp, textAlign: TextAlign.end,  color: isRead ? AppColors.txt1.withOpacity(0.5) : AppColors.txt1),
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
          const Spacer(),
          SizedBox(
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
    { required PaymentData paymentData,
      required String amount,
      isCredit = true,
      required Function() onIconTap}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200.w, child: txtR(paymentData.description, 15.sp, weight: FontWeight.w600)),
          const Spacer(),
          SizedBox(
              width: 90.w,
              child: txtB(amount, 15.sp,
                  weight: FontWeight.w500,
                  color: isCredit ? null : const Color(0xFF950707),
                  textAlign: TextAlign.right)),
          gapW(10.0),
          Tooltip(
              showDuration: const Duration(minutes: 1),
              enableFeedback: true,
              padding: const EdgeInsets.all(5),
              triggerMode: TooltipTriggerMode.tap,
              decoration: const BoxDecoration(color: Colors.transparent),
              richMessage: WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
                  child:  commentPopWidget(
                    title: paymentData.description ??"",
                    date: "Fecha: ${AppUtils.getDate(paymentData.date.toString(), "yyyy-MMM-dd")}",
                    comment: "Monto: ${paymentData.balance}",
                  ),
                ),
              ),
              child: Image.asset(
                AppAssets.info,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.contain,
              )
          ),
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
    {
      required StudentAlert studentAlert,
      required Function() onIconTap}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200.w, child: txtR(studentAlert.asunto ?? "", 15.sp, weight: FontWeight.w600)),
          const Spacer(),
          SizedBox(
              width: 105.w,
              child: txtB( AppUtils.getDate(studentAlert.fechaCreacion.toString(), "yyyy-MM-dd"), 14.sp,
                  weight: FontWeight.w500, textAlign: TextAlign.right)),
          // GestureDetector(onTap: onIconTap,
          //     child: Image.asset(AppAssets.info,width: 30.w,height: 30.h,fit: BoxFit.contain,))
          Tooltip(
              showDuration: const Duration(minutes: 1),
              enableFeedback: true,
              padding: const EdgeInsets.all(5),
              triggerMode: TooltipTriggerMode.tap,
              decoration: const BoxDecoration(color: Colors.transparent),
              richMessage: WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
                  child:  commentPopWidget(
                    title: studentAlert.asunto ?? "",
                    date: "Fecha: ${AppUtils.getDate(studentAlert.fechaCreacion.toString(), "yyyy-MM-dd")}",
                    comment: "Content: ${studentAlert.contenido}" ?? "",
                  ),
                ),
              ),
              child: Image.asset(
                AppAssets.info,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.contain,
              )
          ),
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

void showUserSelectionDialog(BuildContext context, List<GroupMeetEliglibleList> categories) {
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
  final GroupMeetEliglibleList category;

  const CollapsibleCategoryWidget({required this.category});

  @override
  _CollapsibleCategoryWidgetState createState() => _CollapsibleCategoryWidgetState();
}


class _CollapsibleCategoryWidgetState extends State<CollapsibleCategoryWidget> {
  bool _isExpanded = false;
  List<bool> _selectedUsers = [];

  @override
  void initState() {
    super.initState();
    _selectedUsers = List<bool>.filled(widget.category.list.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
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
                  Text(widget.category.name ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  itemCount: widget.category.list.length,
                  itemBuilder: (context, index) {
                    return _selectUserWidget(
                      userName: widget.category.list[index].nombre ?? "",
                      isSelected: _selectedUsers[index],
                      onTap: () {
                        setState(() {
                          _selectedUsers[index] = !_selectedUsers[index];
                          Navigator.pop(context, widget.category.list[index]);
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


// class CollapsibleContactWidget extends StatefulWidget {
//   final GroupCroupContact contact;
//
//   const CollapsibleContactWidget({required this.contact});
//
//   @override
//   _CollapsibleContactWidgetState createState() => _CollapsibleContactWidgetState();
// }
//
// class _CollapsibleContactWidgetState extends State<CollapsibleContactWidget> {
//   bool _isExpanded = false;
//   List<bool> _selectedUsers = [];
//   Set<Contact> selectionList = {};
//   @override
//   void initState() {
//     super.initState();
//     _selectedUsers = List<bool>.filled(widget.contact.list.length, false);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//         margin: EdgeInsets.only(bottom: 30.h),
//         padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 13.h),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.blueBa, width: 2.5.r),
//           borderRadius: BorderRadius.circular(6.3.r),
//           color: AppColors.bgDc,
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.black.withOpacity(0.25),
//               spreadRadius: 0,
//               blurRadius: 4.h,
//               offset: Offset(0, 4.h),
//             )
//           ],
//         ),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _isExpanded = !_isExpanded;
//                 });
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(widget.contact.name ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
//                   const Spacer(),
//                   Icon(
//                     _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//                     color: AppColors.blueBa,
//                     size: 30.r,
//                   )
//                 ],
//               ),
//             ),
//             if (_isExpanded)
//               Container(
//                 constraints: BoxConstraints(maxHeight: 150.h),
//                 child: ListView.builder(
//                   padding: EdgeInsets.symmetric(vertical: 10.h),
//                   //shrinkWrap: true,
//                   //physics: NeverScrollableScrollPhysics(),
//                   itemCount: widget.contact.list.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           _selectedUsers[index] = !_selectedUsers[index];
//                           if (_selectedUsers[index]) {
//                             selectionList.add(widget.contact.list[index]);
//                           } else {
//                             selectionList.remove(widget.contact.list[index]);
//                           }
//                           //  Navigator.pop(context, widget.contact.list[index]);
//                         });
//                       },
//                       child: _selectUserWidget(
//                         userName: widget.contact.list[index].nombrecontacto ?? "",
//                         isSelected: _selectedUsers[index], onTap: () {  },
//
//                       ),
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       );
//   }
//
//   Widget _selectUserWidget({required String userName, required bool isSelected, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(margin: EdgeInsets.only(bottom: 10.h),
//         child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(AppAssets.profile,width: 20.h,height: 20.h,fit: BoxFit.contain,), // Replace with your custom asset
//             gapW(10.w),
//             Expanded(child: txtR(userName,15.sp, weight: FontWeight.w400)),
//             Container(
//               width: 15.w,
//               height: 15.w,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: AppColors.black, width: 1.5.r),
//               ),
//               child: isSelected
//                   ? Center(
//                 child: Container(
//                   width: 7.w,
//                   height: 7.w,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: AppColors.black,
//                   ),
//                 ),
//               )
//                   : const SizedBox(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CollapsibleContactWidget extends StatefulWidget {
  final GroupCroupContact contact;
  final ValueChanged<Set<Contact>> onSelectionChanged;

  const CollapsibleContactWidget({
    required this.contact,
    required this.onSelectionChanged,
  });

  @override
  _CollapsibleContactWidgetState createState() =>
      _CollapsibleContactWidgetState();
}

class _CollapsibleContactWidgetState extends State<CollapsibleContactWidget> {
  bool _isExpanded = false;
  List<bool> _selectedUsers = [];
  Set<Contact> selectionList = {};

  @override
  void initState() {
    super.initState();
    _selectedUsers = List<bool>.filled(widget.contact.list.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
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
                Text(
                  widget.contact.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.blueBa,
                  size: 30.r,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Container(
              constraints: BoxConstraints(maxHeight: 150.h),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: widget.contact.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: _selectUserWidget(
                      userName: widget.contact.list[index].nombrecontacto ?? "",
                      isSelected: _selectedUsers[index],
                      onTap: () {
                        setState(() {
                          _selectedUsers[index] = !_selectedUsers[index];
                          if (_selectedUsers[index]) {
                            selectionList.add(widget.contact.list[index]);
                          } else {
                            selectionList.remove(widget.contact.list[index]);
                          }
                          widget.onSelectionChanged(selectionList); // Notify parent
                        });
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _selectUserWidget({
    required String userName,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        height: 40.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.profile,
              width: 20.h,
              height: 20.h,
              fit: BoxFit.contain,
            ),
            gapW(10.w),
            Expanded(child: txtR(userName, 15.sp, weight: FontWeight.w400)),
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
class SelectFamilyMemberBottomSheet extends StatefulWidget {
  final List<FamilyMember> userFamilyMembers;
  const SelectFamilyMemberBottomSheet({required this.userFamilyMembers, super.key});

  @override
  State<SelectFamilyMemberBottomSheet> createState() => _SelectFamilyMemberBottomSheetState();
}

class _SelectFamilyMemberBottomSheetState extends State<SelectFamilyMemberBottomSheet> {
  TextEditingController searchControl = TextEditingController();
  List<FamilyMember> filteredList = [];

  @override
  void initState() {
    filteredList = widget.userFamilyMembers;
    super.initState();
  }
  void filterItems(String query) {
    setState(() {
      filteredList = widget.userFamilyMembers.where((item) =>
          item.nombreCompleto!.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
  void getUnreadItems(String query) {
    setState(() {
      filteredList = widget.userFamilyMembers.where((item) =>
          item.nombreCompleto!.toLowerCase().contains(query.toLowerCase())).toList();
     }
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ FocusManager.instance.primaryFocus?.unfocus();},
      child: Container(
        width: double.infinity,height: 742.h,
        color: AppColors.d9,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (MediaQuery.of(context).viewInsets.bottom != 0)?
            gapH(30.h):gapH(30.h),
            Container(height: 40.h,width: 350.w,
              padding: EdgeInsets.only(left: 20.w),
              child: TextField(
                  controller: searchControl,
                  onChanged: filterItems,
                  style: GoogleFonts.inter(
                    color: AppColors.txt1,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorHeight: 10.h,
                  cursorColor: AppColors.blueBa,
                  decoration: InputDecoration(
                    fillColor: AppColors.d9,
                    filled: true,
                    hintText: "Search",
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
            gapH(20.h),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 20.h),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return iconAndTextWidget(
                        filteredList[index].nombreCompleto ?? "",(){
                      Navigator.pop(context,  filteredList[index]);
                    });
                  }
              ),
            ),
            gapH(22.h),
          ],
        ),
      ),
    );
  }

  Widget iconAndTextWidget(String title,tap) {
    return GestureDetector(onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.5.h),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        // decoration: BoxDecoration(
        //   color: AppColors.whiteFA,borderRadius: BorderRadius.circular(10.r),
        // ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   width: 34.w,height: 32.h,
            //   decoration: const BoxDecoration(
            //       shape: BoxShape.circle, color: AppColors.green24
            //   ),
            //   child: Center(child: ctmTxtCrtB(title[0].toUpperCase(),color: AppColors.white,12.5.sp),),
            // ),
            // gapW(15.w),
            Image.asset(AppAssets.profile,width: 20.w,height: 20.h,fit: BoxFit.contain,),
            gapW(23.w),
            Expanded(
                child: txtB(title,15.sp,maxLines: 1)),
          ],),
      ),
    );
  }
}



