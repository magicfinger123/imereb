part of 'coupon_cubit.dart';

abstract class CouponState extends Equatable {
  const CouponState();
}

class CouponInitial extends CouponState {
  @override
  List<Object> get props => [];
}
class CouponLoadingState extends CouponState {
  @override
  List<Object> get props => [];
}
class CouponFetchedState extends CouponState {
  List<Cupon> coupons;
  CouponFetchedState(this.coupons);
  @override
  List<Object> get props => [];
}
class CouponCategoryState extends CouponState {
  List<CuponCategory> categories;
  CouponCategoryState(this.categories);
  @override
  List<Object> get props => [];
}
class CouponErrorState extends CouponState {
  String error;
  CouponErrorState(this.error);
  @override
  List<Object> get props => [];
}
