import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/DocumentRequest.dart';
import 'package:bs_educativo/model/response/document/DocumentResponse.dart';
import 'package:bs_educativo/repository/DocumentRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentRepository repository;
  DocumentCubit({required this.repository}) : super(DocumentInitial());
  void fetchDocument(DocumentRequest request) async {
    try {
      emit(DocumentLoadingState());
      final response = await repository.getDocuments(request);
      if (response is List<DocumentItem>) {
        emit(DocumentFetchedState(response));
        AppUtils.debug(" document fetchedsuccess");
      } else {
        emit(DocumentErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(DocumentErrorState("error"));
    }
  }
  void isLoading(){
    emit(DocumentLoadingState());
  }
  void reset(){
    emit(DocumentInitial());
  }
}
