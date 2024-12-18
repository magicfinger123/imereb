import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/ContactRequest.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/request/SendMessageAttachRequest.dart';
import 'package:bs_educativo/model/request/SendMessageRequest.dart';
import 'package:bs_educativo/model/request/getMsgRequest.dart';
import 'package:bs_educativo/model/response/message/ArchiveRequest.dart';
import 'package:bs_educativo/model/response/message/ContactList.dart';
import 'package:bs_educativo/model/response/message/MessageCount.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/MsgAttachment.dart';
import 'package:bs_educativo/model/response/message/SendMessageResponse.dart';
import 'package:bs_educativo/model/response/message/listOfMessagesResponse.dart';
import 'package:bs_educativo/repository/messageRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageRepository repository;
  List<MessageCount> messageCounts = [];
  MessageCubit({required this.repository}) : super(MessageInitial());
  void fetchInbox(GetMessageListRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.getInboxMessages(request);
      if (response is List<Messages>) {
        emit(MessageInboxState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void fetchSentMessage(GetMessageListRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.getSentMessages(request);
      if (response is List<Messages>) {
        emit(MessageInboxState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void fetchDeletedMessage(GetMessageListRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.getDeletedMessages(request);
      if (response is List<Messages>) {
        emit(MessageInboxState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void postDeleteSentMessage(MessageRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.deleteSentMessages(request);
      if (response is bool) {
        emit(MessageDeleteState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void postDeleteMessage(MessageRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.deleteInboxMessage(request);
      if (response is bool) {
        emit(MessageDeleteState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void markMessageAsRead(MessageReadRequest request) async {
    try {
    //  emit(MessageLoading());
      final response = await repository.markReadMessage(request);
      if (response is List<Messages>) {
       // emit(MessageInboxState(response));
        AppUtils.debug("success");
      } else {
     //   emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
    //  emit(MessageErrorState());
    }
  }
  void readInboxMessage(MessageIdRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.readInboxMessage(request);
      if (response is List<MessageData>) {
        emit(MessageInboxDataState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void messageAttachment(MessageRequest request) async {
    try {
      emit(MessageLoading());
      final response = await repository.getMessageAttachment(request);
      if (response is List<MsgAttachment>) {
        emit(MessageAttachmentState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }

  void getMessageCount(GetMessageListRequest request) async {
    try {
   //   emit(MessageLoading());
      final response = await repository.getUnreadMessageCount(request);
      if (response is List<MessageCount>) {
        messageCounts = response;
        emit(MessageCountState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void getContacts(ContactRequest request) async {
    try {
         emit(MessageLoading());
      final response = await repository.getContacts(request);
      if (response is List<Contact>) {
        emit(MessageContactState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void postSendMessage(SendMessageRequest request) async {
    try {
        emit(MessageLoading());
      final response = await repository.sendMessage(request);
      if (response is SendMessageResponse) {
        emit(MessageSentState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void postSendMessageAttach(SentMsgArchiveRequest request) async {
    try {
        emit(MessageLoading());
      final response = await repository.postSendArchive(request);
      if (response is SendMessageResponse) {
        emit(MessageSentAttachState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void postArchive(ArchiveRequest request) async {
    try {
        emit(MessageLoading());
      final response = await repository.postArchive(request);
      if (response is String) {
        emit(ArchiveState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void downloadAttachment(String url, String filenamae) async {
    try {
        emit(MessageLoading());
      final response = await repository.downloadFile(url, filenamae);
      if (response is bool) {
        emit(AttachmentDownloadedState(response));
        AppUtils.debug("success");
      } else {
        emit(MessageErrorState());
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MessageErrorState());
    }
  }
  void resetState() {
    emit(MessageInitial());
  }
  void setUnreadReadMessages(List<Messages> msg){
    emit(MessageSortState(msg));
  }

}
