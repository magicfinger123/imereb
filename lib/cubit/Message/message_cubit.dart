import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/MessageIdRequest.dart';
import 'package:bs_educativo/model/request/getMsgRequest.dart';
import 'package:bs_educativo/model/response/message/MessageData.dart';
import 'package:bs_educativo/model/response/message/listOfMessagesResponse.dart';
import 'package:bs_educativo/repository/messageRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageRepository repository;
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
  void resetState() {
    emit(MessageInitial());
  }
}
