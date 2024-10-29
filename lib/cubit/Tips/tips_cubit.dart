import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/GeneralRequest.dart';
import 'package:bs_educativo/model/response/tips/tips.dart';
import 'package:bs_educativo/repository/TipsRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'tips_state.dart';

class TipsCubit extends Cubit<TipsState> {
  TipsRepository repository;
  TipsCubit(this.repository) : super(TipsInitial());
  List<TipResponse> tips = [];
  void getTips(GeneralRequest request) async {
      try {
        emit(TipsLoadingState());
        final response = await repository.getTips(request);
        if (response is List<TipResponse>) {
          emit(TipsFetchedState(response));
          tips = response;
          AppUtils.debug("successfully fetched meet records");
        } else {
          emit(TipsErrorState("error"));
          AppUtils.debug("error");
        }
      } catch (e) {
        emit(TipsErrorState("error"));
      }
  }
}
