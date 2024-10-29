import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/EC/PaymentData.dart';
import 'package:bs_educativo/repository/EcRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'ec_state.dart';

class EcCubit extends Cubit<EcState> {
  EcRepository repository;
  List<PaymentData> paymentData = [];
  EcCubit(this.repository) : super(EcInitial());
  void getPaymentData(GeneralRequest request) async {
    try {
      emit(EcLoadingState());
      final response = await repository.getEc(request);
      if (response is List<PaymentData>) {
        emit(EcFetchedState(response));
        paymentData = response;
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(EcErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(EcErrorState("error"));
    }
  }
}
