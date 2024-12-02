part of 'meet_cubit.dart';

abstract class MeetState extends Equatable {
  const MeetState();
}

class MeetInitial extends MeetState {
  @override
  List<Object> get props => [];
}
class MeetLoadingState extends MeetState {
  @override
  List<Object> get props => [];
}
class MeetEligilityListState extends MeetState {
  List<MeetEliglibleList> response;
  MeetEligilityListState(this.response);
  @override
  List<Object> get props => [];
}
class MeetError extends MeetState {
  String error;
  MeetError(this.error);
  @override
  List<Object> get props => [];
}

class MeetRequestSubmittedState extends MeetState {
  CitasResponse response;
  MeetRequestSubmittedState(this.response);
  @override
  List<Object> get props => [];
}
class MeetRecordListState extends MeetState {
  List<MeetAllResponse> response;
  MeetRecordListState(this.response);
  @override
  List<Object> get props => [];
}