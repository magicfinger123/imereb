
import 'dart:developer';
import 'package:bs_educativo/ApiService/api_url.dart';
import 'package:bs_educativo/model/request/ContactRequest.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/request/SendMessageAttachRequest.dart';
import 'package:bs_educativo/model/request/SendMessageRequest.dart';
import 'package:bs_educativo/model/response/message/ArchiveRequest.dart';
import 'package:bs_educativo/model/response/message/ContactList.dart';
import 'package:bs_educativo/model/response/message/MessageCount.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
import 'package:bs_educativo/model/response/message/SendMessageResponse.dart';
import 'package:bs_educativo/model/response/message/listOfMessagesResponse.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';
import '../apiService/api_service.dart';
import '../model/request/getMsgRequest.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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
  Future<Object> getContacts(ContactRequest request) async {
    var response = await postRequest(request, AppUrls.getContact, true, HttpMethods.get);
    if(response is String) {
      var r = contactFromJson(response);
      print("contact List: $r");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> sendMessage(SendMessageRequest request) async {
    var response = await postRequest(request, AppUrls.postSendMessage, true, HttpMethods.post);
    if(response is String) {
      var r = sendMessageResponseFromJson(response);
      print("send message response: $r");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> postArchive(ArchiveRequest request) async {
    var response = await postRequest(request, AppUrls.postArchiveImage, true, HttpMethods.post);
    if(response is String) {
      return response;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> postSendArchive(SentMsgArchiveRequest request) async {
    var response = await postRequest(request, AppUrls.sendArchive, true, HttpMethods.post);
    if(response is String) {
      var r = sendMessageResponseFromJson(response);
      print("send message response: $r");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<bool> downloadFile(String url, String fileName) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}