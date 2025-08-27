abstract class RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterState {
  String successMessage;

  RegisterSuccessState({required this.successMessage});
}
