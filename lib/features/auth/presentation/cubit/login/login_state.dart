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

class LoginWithGoogleSuccessState extends LoginState {
  String successMessage;
  LoginWithGoogleSuccessState({required this.successMessage});
}

class LoginWithGoogleErrorState extends LoginState {
  String errorMessage;

  LoginWithGoogleErrorState({required this.errorMessage});
}

class LoginWithGoogleCancelState extends LoginState {}
