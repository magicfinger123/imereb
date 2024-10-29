import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/QR/QRResponse.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';

@Injectable()
class QrRepository extends ApiRepository {
  Future<Object> getQRs(GeneralRequest request) async {
    var response = await postRequest(
        request, AppUrls.studentQR, true, HttpMethods.get);
    if (response is String) {
      var r = qrFromJson(response);
      print("qrResponse: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}