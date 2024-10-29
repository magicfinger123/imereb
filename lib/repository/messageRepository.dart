
import 'package:bs_educativo/ApiService/api_url.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/listOfMessagesResponse.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../apiService/api_service.dart';
import '../model/request/getMsgRequest.dart';

@Injectable()
class MessageRepository extends ApiRepository {
  Future<Object> getInboxMessages(GetMessageListRequest request) async {
    var response = await postRequest(request, AppUrls.getListOfMessageInboxUrl, true, HttpMethods.get);
    if(response is String) {
      var r = messagesFromJson(response);
      print("messages: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> readInboxMessage(MessageIdRequest request) async {
    var response = await postRequest(request, AppUrls.getInboxMessageData, true, HttpMethods.get);
    if(response is String) {
      var r = messageDataFromJson(response);
      print("messageData: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}