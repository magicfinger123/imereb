import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/CouponRequest.dart';
import 'package:bs_educativo/model/response/cupon/Coupon.dart';
import 'package:bs_educativo/model/response/cupon/CuponCategory.dart';
import 'package:bs_educativo/repository/CuponRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';
part 'coupon_state.dart';
class CouponCubit extends Cubit<CouponState> {
  CuponRepository repository;
  CouponCubit(this.repository) : super(CouponInitial());
  List<CuponCategory> categories = [];
  List<Cupon> coupons = [];
  void getCategories(CuponRequest request) async {
    try {
      emit(CouponLoadingState());
      final response = await repository.getCuponCategories(request);
      if (response is List<CuponCategory>) {
        emit(CouponCategoryState(response));
        categories = response;
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(CouponErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(CouponErrorState("error"));
    }
  }
  void getCoupons(CuponRequest request) async {
    try {
      emit(CouponLoadingState());
      final response = await repository.getCupon(request);
      if (response is List<Cupon>) {
        emit(CouponFetchedState(response));
        coupons = response;
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(CouponErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(CouponErrorState("error"));
    }
  }
  void reset(){
    emit(CouponInitial());
  }
}
