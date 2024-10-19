import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

import '../../apiService/api_service.dart';
import '../../model/request/LoginRequest.dart';
import '../../model/response/LoginAdminResponse.dart';
import '../../model/response/LoginResponse.dart';
import '../../model/response/loginIndividualResponse.dart';
import '../../repository/authRepository.dart';
import '../../utility/app_util.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepository;


  AuthCubit({required this.authRepository}) : super(AuthInitial())  {
  }

  // void login(LoginRequest request) async {
  //   emit(ApiLoadingState());
  //   try {
  //     final response = await authRepository.loginDifferentTypesOfUsers(request);
  //     if (response is LoginResponse) {
  //       accessToken = response.token??"";
  //       emit(LoginSuccessState(response));
  //       AppUtils.debug("Login Validated parent");
  //     }else if(response is LoginAdminResponse){
  //       accessToken = response.token??"";
  //       emit(LoginAdminSuccessState(response));
  //       AppUtils.debug("Login Validated admin");
  //     }
  //     else{
  //       emit(AuthStateErrorState(response as String));
  //       AppUtils.debug("error1");
  //     }
  //   }catch(e){
  //     emit(AuthStateErrorState(AppUtils.defaultErrorResponse()));
  //     AppUtils.debug("error caught2");
  //   }
  // }
  void login(LoginRequest request) async {
    emit(ApiLoadingState());
    try {
      final response = await authRepository.loginDifferentTypesOfUsers(request);

      if (response is LoginResponse) {
        accessToken = response.token ?? "";
        emit(LoginSuccessState(response));
        AppUtils.debug("Login Validated for regular user.");
      } else if(response is LoginIndividualResponse){
        accessToken = response.token ?? "";
        emit(LoginIndividualSuccessState(response));
        AppUtils.debug("Login Validated for Individual user.");
      }
      else if (response is LoginAdminResponse) {
        accessToken = response.token ?? "";
        emit(LoginAdminSuccessState(response));
        AppUtils.debug("Login Validated for admin user.");
      } else {
        emit(AuthStateErrorState(response as String));
        AppUtils.debug("Error: Response not recognized as admin or parent.");
      }
    } catch (e) {
      emit(AuthStateErrorState(AppUtils.defaultErrorResponse()));
      AppUtils.debug("Error caught: $e");
    }
  }

  void resetState() {
    emit(AuthInitial());
  }

}