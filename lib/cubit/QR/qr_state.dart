part of 'qr_cubit.dart';

abstract class QrState extends Equatable {
  const QrState();
}
class QrInitial extends QrState {
  @override
  List<Object> get props => [];
}
class QrFetchedState extends QrState {
  List<Qr> qrItems;
  QrFetchedState(this.qrItems);
  @override
  List<Object> get props => [];
}
class QrErrorState extends QrState {
  String error;
  QrErrorState(this.error);
  @override
  List<Object> get props => [];
}
class QrLoadingState extends QrState {
  @override
  List<Object> get props => [];
}

