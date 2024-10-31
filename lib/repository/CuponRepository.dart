import 'package:bs_educativo/model/request/CouponRequest.dart';
import 'package:bs_educativo/model/response/cupon/Coupon.dart';
import 'package:bs_educativo/model/response/cupon/CuponCategory.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';

@Injectable()
class CuponRepository extends ApiRepository {
  Future<Object> getCuponCategories(CuponRequest request) async {
    var response = await postRequest(
        request, AppUrls.couponCategory, true, HttpMethods.get);
    if (response is String) {
      var r = cuponCategoryFromJson(response);
      print("coupon categories: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> getCupon(CuponRequest request) async {
    var response = await postRequest(
        request, AppUrls.couponGet, true, HttpMethods.get);
    if (response is String) {
      var r = cuponFromJson(response);
      print("coupon response: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}