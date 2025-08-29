abstract class LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginState {
  String successMessage;

  LoginSuccessState({required this.successMessage});
}
