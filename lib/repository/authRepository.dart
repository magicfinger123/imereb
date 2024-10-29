import 'dart:convert';

import 'package:bs_educativo/ApiService/api_status.dart';
import 'package:bs_educativo/model/request/LoginRequest.dart';
import 'package:bs_educativo/model/response/LoginResponse.dart';
import 'package:bs_educativo/model/response/loginIndividualResponse.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:injectable/injectable.dart';

import '../apiService/api_service.dart';
import '../apiService/api_url.dart';
import '../model/response/LoginAdminResponse.dart';
import '../model/response/message/listOfMessagesResponse.dart';


@Injectable()
class AuthRepo extends ApiRepository {

  // Future<Object> loginUserEmail(request) async {
  //   var response = await postRequest(request, AppUrls.loginUser, false, HttpMethods.post);
  //   var r = handleSuccessResponse(response);
  //   if (r is ApiResponse) {
  //     if (r.success == true) {
  //       LoginResponse res = loginResponseFromJson(json.encode(r.result?.data));
  //       return res;
  //     } else {
  //       return r;
  //     }
  //   }
  //   else {
  //     handleErrorResponse(response);
  //     return errorResponse!;
  //   }
  // }
  Future<Object> loginDifferentTypesOfUsers(LoginRequest request) async {
    var response = await postRequest(request, AppUrls.loginUser, false, HttpMethods.get);
    if(response is String) {
      var r = loginResponseFromJson(response);
      AppConstant.userLoginResponse = r;
      print("messages: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }

    // if (response is String && response.isNotEmpty) {
    //   try {
    //     var jsonResponse = json.decode(response); // Decode the response to a Map
    //     if (jsonResponse["IdxAdministrativo"] != null) {
    //       // It's an admin user
    //       AppUtils.debug("It's an admin user");
    //       LoginAdminResponse res = loginAdminResponseFromJson(json.encode(jsonResponse));
    //       return res;
    //     } else {
    //       if(jsonResponse["LoginXFamilia"] != 1 ){
    //         // It's an individual user
    //         AppUtils.debug("It's individual user");
    //         LoginIndividualResponse res = loginIndividualResponseFromJson(json.encode(jsonResponse));
    //         return res;
    //       }else{
    //         // It's a parent or regular user
    //         AppUtils.debug("It's a parent");
    //         LoginResponse res = loginResponseFromJson(json.encode(jsonResponse));
    //         return res;
    //       }
    //     }
    //   } catch (e) {
    //     handleErrorResponse(response);
    //     AppUtils.debug("aaa");
    //     return errorResponse!;
    //   }
    // } else {
    //   handleErrorResponse(response);
    //   return errorResponse!;
    // }
  }


}