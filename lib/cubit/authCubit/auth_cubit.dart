import 'package:bloc/bloc.dart';
import 'package:bs_educativo/LocalStorage/UserUtils.dart';
import 'package:bs_educativo/utility/AppConstant.dart';
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
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  void login(LoginRequest request) async {
    emit(AuthLoadingState());
    try {
      final response = await authRepository.loginDifferentTypesOfUsers(request);

      if (response is LoginResponse) {
        accessToken = response.token ?? "";
        AppConstant.appUserType = AppConstant.userLoginResponse?.idxAdministrativo != null ? "Admin" : "Individual";
        SharedPref.save(SharedPrefKeys.loginRequestInfo,
            request.toJson());
        emit(LoginSuccessState(response));
        AppUtils.debug("Login Validated for regular user.");
      }
      else {
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