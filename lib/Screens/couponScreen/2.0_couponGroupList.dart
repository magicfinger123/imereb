import 'package:bs_educativo/cubit/coupon/coupon_cubit.dart';
import 'package:bs_educativo/model/request/CouponRequest.dart';
import 'package:bs_educativo/model/response/cupon/Coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../utility/colors.dart';
import '../../utility/iconsAndImages.dart';
import '../../utility/widgets.dart';
import '../agendaScreen/2.0_agendaCalendarView.dart';


class CouponGroupListView extends StatefulWidget {
  final Function(int, {List<Cupon>? couponList}) onScreenChange;
  const CouponGroupListView({super.key, required this.onScreenChange});

  @override
  State<CouponGroupListView> createState() => _CouponGroupListViewState();
}

class _CouponGroupListViewState extends State<CouponGroupListView> {
  late CouponCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      cubit.getCategories(CuponRequest(opcion: 1, idTipoCupon: 0));
    });
  }
  @override
  Widget build(BuildContext context) {

    cubit = context.read();
    return BlocBuilder<CouponCubit, CouponState>(
      builder: (context, state) {
        if (state is CouponFetchedState){
          WidgetsBinding.instance.addPostFrameCallback((_){
            Future.delayed(Duration.zero, (){
              widget.onScreenChange(1,couponList:  state.coupons);
            });
            cubit.reset();
          });

        }
        return LoadingOverlay(
          isLoading: state is CouponLoadingState,
          child: Container(height: 600.h,
              width: double.infinity,
              //padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
              decoration: deco(),
              child:
            GridView.count(
              crossAxisCount: 2, // Number of columns
              padding: EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: List.generate(
                  cubit.categories.length, (index) {
                var c = cubit.categories[index];
                return
                  menuListItem2(c.descripcion, c.refImagen,(){
                   // widget.onScreenChange(1);
                    cubit.getCoupons(CuponRequest(idCupon: 0, idTipoCupon: c.idTipoCupon, fechaFin: 0, fechaInicio: 0, opcion: 1 ));
                  });
                  Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      'Item ${c.descripcion}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              }),
            ),
            ));
              // Column(
              //   children: [
              //     titleCard("Cupones"),
              //     gapH(10.h),
              //     Expanded(
              //       child: SingleChildScrollView(
              //         padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              //         child:
              //         // GridView.count(
              //         //   crossAxisCount: 2, // Number of columns
              //         //   padding: EdgeInsets.all(8.0),
              //         //   crossAxisSpacing: 8.0,
              //         //   mainAxisSpacing: 8.0,
              //         //   children: List.generate(
              //         //       cubit.categories.length, (index) {
              //         //     var c = cubit.categories[index];
              //         //     return Container(
              //         //       color: Colors.blueAccent,
              //         //       child: Center(
              //         //         child: Text(
              //         //           'Item ${c.descripcion}',
              //         //           style: TextStyle(color: Colors.white, fontSize: 18),
              //         //         ),
              //         //       ),
              //         //     );
              //         //   }),
              //         // ),
              //      // ),
              //       Column(children: [
              //         gapH(30.h),
              //         Row(
              //           children: [
              //             menuListItem("Viajes", AppAssets.trips, (){
              //               widget.onScreenChange(1);
              //             }),
              //             const Spacer(),
              //             menuListItem("Electrónica", AppAssets.speaker,(){widget.onScreenChange(1);}),
              //           ],
              //         ),
              //         gapH(30.h),
              //         Row(
              //           children: [
              //             menuListItem("Hogar", AppAssets.homeTwo,(){widget.onScreenChange(1);}),
              //             const Spacer(),
              //             menuListItem("Joyería", AppAssets.watch,(){widget.onScreenChange(1);}),
              //           ],
              //         ),
              //         gapH(30.h),
              //         Row(
              //           children: [
              //             menuListItem("Ropa", AppAssets.bag,(){widget.onScreenChange(1);}),
              //             const Spacer(),
              //
              //           ],
              //         ),
              //         gapH(30.h),
              //
              //       ],)),
              //     ),
              //   ],
              // )
        //   ),
        // );
      },
    );
  }

}
