import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/Alert/Alert.dart';
import 'package:bs_educativo/repository/AlertRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'alert_state.dart';

class AlertCubit extends Cubit<AlertState> {
  AlertRepository repository;
  AlertCubit(this.repository) : super(AlertInitial());
  List<StudentAlert> alerts = [];

  void getAlerts(GeneralRequest request) async {
    try {
      emit(AlertLoading());
      final response = await repository.getAlerts(request);
      if (response is List<StudentAlert>) {
        emit(AlertFetchedState(response));
        alerts = response;
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(AlertErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(AlertErrorState("error"));
    }
  }
}
