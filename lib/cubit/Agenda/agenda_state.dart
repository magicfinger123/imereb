part of 'agenda_cubit.dart';

abstract class AgendaState extends Equatable {
  const AgendaState();
}

class AgendaInitial extends AgendaState {
  @override
  List<Object> get props => [];
}

class AgendaLoadingState extends AgendaState {
  @override
  List<Object> get props => [];
}
class AgendaItemsState extends AgendaState {
  List<AgendaItem> agendas;
  AgendaItemsState({required this.agendas});
  @override
  List<Object> get props => [];
}
class AgendaDetailState extends AgendaState {
  List<AgentDetailItem> agendas;
  AgendaDetailState({required this.agendas});
  @override
  List<Object> get props => [];
}
class AgendaErrorState extends AgendaState {
  String error;
  AgendaErrorState(this.error);
  @override
  List<Object> get props => [];
}