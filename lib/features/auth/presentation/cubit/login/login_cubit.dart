import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/data/login/repository/login_repository.dart';
import 'package:movies_app/features/auth/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;
  LoginCubit({required this.loginRepository}) : super(LoginLoadingState());

  // hold data - handle logic

  void login(LoginRequest userInfo) async {
    emit(LoginLoadingState());

    var response = await loginRepository.login(userInfo);

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(LoginSuccessState(successMessage: response.message));
    } else {
      emit(LoginErrorState(errorMessage: response.message));
    }
  }
}
