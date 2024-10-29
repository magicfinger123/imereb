part of 'alert_cubit.dart';

abstract class AlertState extends Equatable {
  const AlertState();
}

class AlertInitial extends AlertState {
  @override
  List<Object> get props => [];
}


class AlertLoading extends AlertState {
  @override
  List<Object> get props => [];
}


class AlertFetchedState extends AlertState {
  List<StudentAlert> items;
  AlertFetchedState(this.items);
  @override
  List<Object> get props => [];
}


class AlertErrorState extends AlertState {
  String error;
  AlertErrorState(this.error);
  @override
  List<Object> get props => [];
}



