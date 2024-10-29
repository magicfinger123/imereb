import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/AgendaDetailRequest.dart';
import 'package:bs_educativo/model/request/AgendaListRequest.dart';
import 'package:bs_educativo/model/response/agenda/AgendaDetailItem.dart';
import 'package:bs_educativo/model/response/agenda/AgendaItem.dart';
import 'package:bs_educativo/repository/AgendaRepository.dart';
import 'package:equatable/equatable.dart';

import '../../utility/app_util.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  AgendaRepository repository;
  AgendaCubit({required this.repository}) : super(AgendaInitial());
  void fetchAgendaList(AgendaListRequest request) async {
    try {
      emit(AgendaLoadingState());
      final response = await repository.getAgendaList(request);
      if (response is List<AgendaItem>) {
        emit(AgendaItemsState(agendas: response));
        AppUtils.debug(" document agendas");
      } else {
        emit(AgendaErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(AgendaErrorState("error"));
    }
  }
  void fetchAgendaDetailItem(AgendaDetailRequest request) async {
    try {
      emit(AgendaLoadingState());
      final response = await repository.getAgendaDetailList(request);
      if (response is List<AgentDetailItem>) {
        emit(AgendaDetailState(agendas: response));
        AppUtils.debug(" document agendas");
      } else {
        emit(AgendaErrorState("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(AgendaErrorState("error"));
    }
  }

  void resetState() {
    emit(AgendaInitial());
  }

}
