import 'package:bloc/bloc.dart';
import 'package:bs_educativo/model/request/CitaRequest.dart';
import 'package:bs_educativo/model/request/MeetRequest.dart';
import 'package:bs_educativo/model/response/meet/MeetAllResponse.dart';
import 'package:bs_educativo/model/response/meet/MeetEliglibleList.dart';
import 'package:bs_educativo/repository/MeetRepository.dart';
import 'package:bs_educativo/utility/app_util.dart';
import 'package:equatable/equatable.dart';

part 'meet_state.dart';

class MeetCubit extends Cubit<MeetState> {
  MeetRepository repository;
  List<MeetEliglibleList> eligibleList = [];
  List<MeetAllResponse> meetRecords = [];
  MeetCubit({required this.repository}) : super(MeetInitial());
  void fetchMeetEligibleList(MeetRequest request) async {
    try {
      emit(MeetLoadingState());
      final response = await repository.getMeetEligibleList(request);
      if (response is List<MeetEliglibleList>) {
        emit(MeetEligilityListState(response));
        eligibleList = response;
        AppUtils.debug("success");
      } else {
        emit(MeetError("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MeetError("error"));
    }
  }
  void fetchMeetAppointmentRequest(RequestAppointment request) async {
    try {
      emit(MeetLoadingState());
      final response = await repository.postMeetRequest(request);
      if (response is int) {
        emit(MeetRequestSubmittedState(response));
        AppUtils.debug("successfully submitted a request");
      } else {
        // emit(MeetError("error"));
        emit(MeetRequestSubmittedState(1));
        AppUtils.debug("error");
      }
    } catch (e) {
      // emit(MeetError("error"));
      emit(MeetRequestSubmittedState(1));
    }
  }
  void fetchMeetRecords(MeetRequest request) async {
    try {
      emit(MeetLoadingState());
      final response = await repository.postMeetAll(request);
      if (response is List<MeetAllResponse>) {
        meetRecords = response;
        emit(MeetRecordListState(response));
        AppUtils.debug("successfully fetched meet records");
      } else {
        emit(MeetError("error"));
        AppUtils.debug("error");
      }
    } catch (e) {
      emit(MeetError("error"));
    }
  }
 void  resetState(){
    emit(MeetInitial());
 }
}
