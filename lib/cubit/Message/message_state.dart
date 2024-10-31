part of 'message_cubit.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}
class MessageInitial extends MessageState {
  @override
  List<Object> get props => [];
}
class MessageLoading extends MessageState {
  @override
  List<Object> get props => [];
}
class MessageInboxState extends MessageState {
  final List<Messages> response;
  const MessageInboxState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageInboxDataState extends MessageState {
  final List<MessageData> response;
  const MessageInboxDataState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageReadState extends MessageState {
  final List<MessageData> response;
  const MessageReadState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageDeleteState extends MessageState {
  final bool response;
  const MessageDeleteState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageCountState extends MessageState {
  final List<MessageCount> response;
  const MessageCountState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageDeleteSentState extends MessageState {
  final bool response;
  const MessageDeleteSentState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageAttachmentState extends MessageState {
  final List<MsgAttachment> response;
  const MessageAttachmentState(this.response);
  @override
  List<Object> get props => [response];
}
class MessageErrorState extends MessageState {
  @override
  List<Object> get props => [];
}