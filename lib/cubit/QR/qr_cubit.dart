import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/QR/QRResponse.dart';
import 'package:bs_educativo/repository/QRRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrRepository repository;
  QrCubit(this.repository) : super(QrInitial());
  List<Qr> qrItems = [];

  void getQrS(GeneralRequest request) async {
    try {
      emit(QrLoadingState());
      final response = await repository.getQRs(request);
      if (response is List<Qr>) {
        emit(QrFetchedState(response));
        qrItems = response;
        AppUtils.debug("successfully fetched qr records");
      } else {
        emit(QrErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(QrErrorState("error"));
    }
  }
}
