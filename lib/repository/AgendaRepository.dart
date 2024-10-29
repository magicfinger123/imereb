import 'dart:developer';
import 'package:bs_educativo/model/request/AgendaDetailRequest.dart';
import 'package:bs_educativo/model/request/AgendaListRequest.dart';
import 'package:bs_educativo/model/response/agenda/AgendaDetailItem.dart';
import 'package:bs_educativo/model/response/agenda/AgendaItem.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';
import '../apiService/api_service.dart';
import '../ApiService/api_url.dart';

@Injectable()
class AgendaRepository extends ApiRepository {
  Future<Object> getAgendaList(AgendaListRequest request) async {
    var response = await postRequest(request, AppUrls.getAgenda, true, HttpMethods.get);
    if(response is String) {
      try {
        var r = agendaItemFromJson(response);
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

  Future<Object> getAgendaDetailList(AgendaDetailRequest request) async {
    var response = await postRequest(request, AppUrls.getAgendaDetail, true, HttpMethods.get);
    if(response is String) {
      try {
        var r = agentDetailItemFromJson(response);
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