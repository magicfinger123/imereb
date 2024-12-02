import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../utility/app_util.dart';
import 'api_status.dart';
import 'api_url.dart';

String accessToken = "";
String group = 'I - A';
String counselor = 'Cristina Arcia';


enum HttpMethods {
  post, put, patch, get, delete
}
@lazySingleton
class ApiService{
  static var client = http.Client();
  static Dio dio = Dio();
  static  void initiateDio( bool requireAccess , {String baseUrl = AppUrls.baseUrl}) {
    dio.options
      ..baseUrl = baseUrl
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = header(requireAccess);
    dio.interceptors.add (
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
  }
  static Map<String, String> header(bool requireAccess) {
    return  requireAccess ? {
      HttpHeaders.userAgentHeader: 'dio',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    } : {
      HttpHeaders.userAgentHeader: 'dio',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
  static Future<Object> makeApiCall(request,url,  bool requireAccess,  {bool? isAdmin = false, HttpMethods method =  HttpMethods.post, String baseUrl = AppUrls.baseUrl}) async {
    initiateDio(requireAccess, baseUrl: baseUrl);
    try {
      var body = request != null ? json.encode(request.toJson()) : null;
      Response<String>? response;
      switch (method) {
        case HttpMethods.post:
          response =  await dio.post(url, data: body);
          AppUtils.debug("method: post");
          break;
        case HttpMethods.put:
          response =  await dio.put(url, data: body);
          AppUtils.debug("method: put");
          break;
        case HttpMethods.patch:
          response =  await dio.patch(url, data: body);
          AppUtils.debug("method: patch");
          break;
        case HttpMethods.get:
          AppUtils.debug("trying a get request");
          if (request == null){
            response =  await dio.get(url);
          }else {
            print("req to send ${request.toJson}");
            response = await dio.get(url, queryParameters: request.toJson());
          }
          AppUtils.debug("method: get");
          break;
        case HttpMethods.delete:
          response =  await dio.delete(url, data: body);
          AppUtils.debug("method: delete");
          break;
      }

      if (ApiResponseCodes.success == response.statusCode){
        return Success(response.statusCode!,response.data as String);
      }
      if (ApiResponseCodes.error == response.statusCode || ApiResponseCodes.internalServerError == response.statusCode){
        return  Failure(response.statusCode!,"Error occurred");
      }
      if (ApiResponseCodes.authorizationError == response.statusCode){
        return ForbiddenAccess();
      }
      else{
        return  Failure(response.statusCode!,"Error Occurred");
      }
    } on DioError catch (e){
      AppUtils.debug(e.message);
      return  UnExpectedError();
    }
  }
  static Future<Object> uploadDoc(File file, String url, String docType) async {
    try {
      var headers =  header(true);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields['DocumentType'] = docType;
      request.files.add(
          http.MultipartFile(
              'Image',
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split("/").last
          )
      );
      AppUtils.debug("/****rest call request starts****/");
      AppUtils.debug("url: $url");
      AppUtils.debug("headers: $headers");
      var res = await request.send();
      final response = await res.stream.bytesToString();
      AppUtils.debug("/****rest call response starts****/");
      AppUtils.debug("status code: ${res.statusCode}");
      AppUtils.debug("rest response: "+response);
      if (ApiResponseCodes.success == res.statusCode){
        return  Success(res.statusCode,response);
      }
      if (ApiResponseCodes.error == res.statusCode || ApiResponseCodes.internalServerError == res.statusCode){
        return  Failure(res.statusCode,("Error Occurred"));
      }
      if (ApiResponseCodes.authorizationError == res.statusCode){
        return ForbiddenAccess();
      }
      else{
        return  Failure(res.statusCode,"Error Occurred");
      }
    }on HttpException{
      return  NetWorkFailure();

    }on FormatException{
      return  UnExpectedError();

    }catch (e){
      return UnExpectedError();
    }
  }
  Future<String?> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl));
    final bytes = response.bodyBytes;
    return (bytes != null ? base64Encode(bytes) : null);
  }
}