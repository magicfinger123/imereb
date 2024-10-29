import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/NotasDetailer.dart';
import 'package:bs_educativo/model/response/note/Notas.dart';
import 'package:bs_educativo/repository/NoteRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteRepository repository;
  List<Notas> notes = [];
  NoteCubit(this.repository) : super(NoteInitial());
  void getNotes(NotasDetailerRequest request) async {
    try {
      emit(NoteLoadingState());
      final response = await repository.getNotes(request);
      if (response is List<Notas>) {
        emit(NoteFetchedState(response));
        notes = response;
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(NoteErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(NoteErrorState("error"));
    }
  }
  void getNoteDetails(NotasDetailerRequest request) async {
    try {
      emit(NoteLoadingState());
      final response = await repository.getNoteDetails(request);
      if (response is List<Notas>) {
        emit(NoteFetchedState(response));
        notes = response;
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(NoteErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(NoteErrorState("error"));
    }
  }
}
