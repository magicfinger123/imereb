import 'dart:developer';

import 'package:bs_educativo/model/request/DocumentRequest.dart';
import 'package:bs_educativo/model/response/document/DocumentResponse.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';
import '../apiService/api_service.dart';
import '../ApiService/api_url.dart';

@Injectable()
class DocumentRepository extends ApiRepository {
  Future<Object> getDocuments(DocumentRequest request) async {
    var response = await postRequest(request, AppUrls.getDocuments, true, HttpMethods.get);
    if(response is String) {
      try {
        var r = documentItemFromJson(response);
        log("documents: ${r}");
        return r;
      }catch (e){
        log("error: $e");
        handleErrorResponse(response);
        return errorResponse!;
      }
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}