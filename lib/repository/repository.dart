import '../apiService/api_service.dart';
import '../apiService/api_status.dart';
import '../utility/app_util.dart';

class ApiRepository{
  // ApiResponse? _errorResponse;
  // ApiResponse? get errorResponse => _errorResponse;
  // setErrorResponse(ApiResponse? value) {
  //   _errorResponse = value;
  // }
  String? _errorResponse;
  String? get errorResponse => _errorResponse;
  setErrorResponse(String? value) {
    _errorResponse = value;
  }
  handleErrorResponse(dynamic response) {
    if (response is Failure) {
      if (response.errorResponse == null) {
        try {
          setErrorResponse("Error Occurred1");
        }
        catch (e) {
          setErrorResponse("Error occurred2");
        }
      }else{
        setErrorResponse("Error occurred2");
      }
    }else if(response is ForbiddenAccess){
      setErrorResponse("Forbidden access4");
    }else if(response is UnExpectedError){
      setErrorResponse("Unexpected error occurred5");
    }else if(response is NetWorkFailure){
      setErrorResponse("Network Failure6");
    }
  }


  // Object handleSuccessResponse(dynamic response) {
  //   if (response is Success) {
  //     var r = response;//defaultApiResponseFromJson(response.response as String);
  //     return r;
  //   }else{
  //     AppUtils.debug("111  sjsdkdklsskljdsddl*********************************  (***");
  //     handleErrorResponse(response);
  //     return errorResponse!;
  //   }
  // }
  Future<Object> postRequest(request, url, requiresToken, HttpMethods method) async {
    var response = await ApiService.makeApiCall(request, url, requiresToken, isAdmin : requiresToken, method: method);
    if(response is Success) {
      // var r = apiResponseFromJson(response.response as String);
      var r = response.response as String;
      return r;
    } else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }

}