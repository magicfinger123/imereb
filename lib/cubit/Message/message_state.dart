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
class MessageErrorState extends MessageState {
  @override
  List<Object> get props => [];
}