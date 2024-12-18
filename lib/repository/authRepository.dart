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
  }
}