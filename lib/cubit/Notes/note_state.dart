part of 'note_cubit.dart';

abstract class NoteState extends Equatable {
  const NoteState();
}
class NoteInitial extends NoteState {
  @override
  List<Object> get props => [];
}
class NoteLoadingState extends NoteState {
  @override
  List<Object> get props => [];
}
class NoteFetchedState extends NoteState {
  List<Notas> notes;

  NoteFetchedState(this.notes);

  @override
  List<Object> get props => [];
}
class NoteDetailFetchedState extends NoteState {

  @override
  List<Object> get props => [];
}
class NoteErrorState extends NoteState {
  String error;
  NoteErrorState(this.error);
  @override
  List<Object> get props => [];
}