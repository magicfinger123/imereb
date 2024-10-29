

import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/EC/PaymentData.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';

@Injectable()
class EcRepository extends ApiRepository {
  Future<Object> getEc(GeneralRequest request) async {
    var response = await postRequest(
        request, AppUrls.ec, true, HttpMethods.get);
    if (response is String) {
      var r = paymentDataFromJson(response);
      print("messages: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}