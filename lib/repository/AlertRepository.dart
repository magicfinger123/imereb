import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/Alert/Alert.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';

@Injectable()
class AlertRepository extends ApiRepository {
  Future<Object> getAlerts(GeneralRequest request) async {
    var response = await postRequest(
        request, AppUrls.studentAlerts, true, HttpMethods.get);
    if (response is String) {
      var r = studentAlertFromJson(response);
      print("alertsResponse: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}