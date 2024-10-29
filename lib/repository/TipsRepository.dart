import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/tips/tips.dart';
import 'package:injectable/injectable.dart';

import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';
import 'repository.dart';

@Injectable()
class TipsRepository extends ApiRepository {
  Future<Object> getTips(GeneralRequest request) async {
    var response = await postRequest(
        request, AppUrls.tips, true, HttpMethods.get);
    if (response is String) {
      var r = tipResponseFromJson(response);
      print("messages: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}