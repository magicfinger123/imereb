part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable{}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends AuthState {
  final LoginResponse response;
  LoginSuccessState(this.response);
  @override
  List<Object> get props => [response];
}
// class LoginIndividualSuccessState extends AuthState {
//   final LoginIndividualResponse response;
//   LoginIndividualSuccessState(this.response);
//   @override
//   List<Object> get props => [response];
// }
// class LoginAdminSuccessState extends AuthState {
//   final LoginAdminResponse response;
//   LoginAdminSuccessState(this.response);
//   @override
//   List<Object> get props => [response];
// }


class AuthStateErrorState extends AuthState {
  final String errorResponse;
  AuthStateErrorState(this.errorResponse);
  @override
  List<Object> get props => [errorResponse];
}
