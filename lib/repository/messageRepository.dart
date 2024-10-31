
import 'dart:developer';

import 'package:bs_educativo/ApiService/api_url.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/response/message/MessageCount.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
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
  Future<Object> getSentMessages(GetMessageListRequest request) async {
    var response = await postRequest(request, AppUrls.sentMessages, true, HttpMethods.get);
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
  Future<Object> getDeletedMessages(GetMessageListRequest request) async {
    var response = await postRequest(request, AppUrls.deletedMessages, true, HttpMethods.get);
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
  Future<Object> deleteInboxMessage(MessageRequest request) async {
    var response = await postRequest(request, AppUrls.deleteMessages, true, HttpMethods.post);
    if(response is String) {
      return true;
    }
    else {
      return false;
    }
  }
  Future<Object> deleteSentMessages(MessageRequest request) async {
    var response = await postRequest(request, AppUrls.deleteSentMessages, true, HttpMethods.post);
    if(response is String) {
      return true;
    }
    else {
      return false;
    }
  }
  Future<Object> getMessageAttachment(MessageRequest request) async {
    var response = await postRequest(request, AppUrls.getMessageAttachment, true, HttpMethods.get);
    if(response is String) {
      var r = msgAttachmentFromJson(response);
      log("attachment: ${r}");
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
  Future<Object> markReadMessage(MessageReadRequest request) async {
    var response = await postRequest(request, AppUrls.readMessages, true, HttpMethods.get);
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
  Future<Object> getUnreadMessageCount(GetMessageListRequest request) async {
    var response = await postRequest(request, AppUrls.getUnreadCount, true, HttpMethods.get);
    if(response is String) {
      var r = messageCountFromJson(response);
      print("messageData: $r");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}