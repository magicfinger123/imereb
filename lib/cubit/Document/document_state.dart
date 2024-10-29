part of 'document_cubit.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();
}
class DocumentInitial extends DocumentState {
  @override
  List<Object> get props => [];
}
class DocumentLoadingState extends DocumentState {
  @override
  List<Object> get props => [];
}
class DocumentFetchedState extends DocumentState {
  List<DocumentItem> response;
  DocumentFetchedState(this.response);
  @override
  List<Object> get props => [];
}
class DocumentErrorState extends DocumentState {
  String error;
  DocumentErrorState(this.error);
  @override
  List<Object> get props => [];
}