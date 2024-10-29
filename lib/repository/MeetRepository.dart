
import 'package:bs_educativo/ApiService/api_status.dart';
import 'package:bs_educativo/model/request/MeetRequest.dart';
import 'package:bs_educativo/model/response/meet/MeetAllResponse.dart';
import 'package:bs_educativo/model/response/meet/MeetEliglibleList.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';
import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';
import '../model/request/CitaRequest.dart';


@Injectable()
class MeetRepository extends ApiRepository {
  Future<Object> getMeetEligibleList(MeetRequest request) async {
    var response = await postRequest(request, AppUrls.meeteligiblelist, true, HttpMethods.get);
    if(response is String) {
      var r = meetEliglibleListFromJson(response);
      print("meetEligibleList: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> postMeetRequest(RequestAppointment request) async {
    var response = await ApiService.makeApiCall(request, AppUrls.meetapllyfor, true, isAdmin : true, method:  HttpMethods.post);
    if(response is Success) {
      if (response.response is String){
        if (response.response == ""){
          return 1;
        }
      }
      var  r = response.response as int;
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> postMeetAll(MeetRequest request) async {
    var response = await postRequest(request, AppUrls.meetaAll, true, HttpMethods.get);
    if(response is String) {
      var r = meetAllResponseFromJson(response);
      print("meetallResponse: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}