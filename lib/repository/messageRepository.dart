import 'dart:convert';

import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../apiService/api_service.dart';
import '../apiService/api_url.dart';
import '../model/request/getMsgRequest.dart';
import '../utility/app_util.dart';

@Injectable()
class AuthRepo extends ApiRepository {


  Future<Object> getListOfMessages(GetMessageListRequest request) async {
    var response = await postRequest(null, "${AppUrls.getListOfMessageUrl}?idColegio=${request.idColegio}&cedula=${request.cedula}", true, HttpMethods.get);

    if (response is String && response.isNotEmpty && response != "[]") {
      return response;
      // try {
      //   var jsonResponse = json.decode(response); // Decode the response to a Map
      //   if (jsonResponse["IdxAdministrativo"] != null) {
      //     // It's an admin user
      //     AppUtils.debug("It's an admin user");
      //     LoginAdminResponse res = loginAdminResponseFromJson(json.encode(jsonResponse));
      //     return res;
      //   } else {
      //     if(jsonResponse["LoginXFamilia"] != 1 ){
      //       // It's an individual user
      //       AppUtils.debug("It's individual user");
      //       LoginIndividualResponse res = loginIndividualResponseFromJson(json.encode(jsonResponse));
      //       return res;
      //     }else{
      //       // It's a parent or regular user
      //       AppUtils.debug("It's a parent");
      //       LoginResponse res = loginResponseFromJson(json.encode(jsonResponse));
      //       return res;
      //     }
      //   }
      // } catch (e) {
      //   handleErrorResponse(response);
      //   AppUtils.debug("aaa");
      //   return errorResponse!;
      // }
    } else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }



}