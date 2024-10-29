part of 'ec_cubit.dart';

abstract class EcState extends Equatable {
  const EcState();
}
class EcInitial extends EcState {
  @override
  List<Object> get props => [];
}
class EcLoadingState extends EcState {
  @override
  List<Object> get props => [];
}
class EcFetchedState extends EcState {
  List<PaymentData> data;
  EcFetchedState(this.data);
  @override
  List<Object> get props => [];
}
class EcErrorState extends EcState {
  String error;
  EcErrorState(this.error);
  @override
  List<Object> get props => [];
}
