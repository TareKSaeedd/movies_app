import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/core/network/shared_pref_network.dart';
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
      await SharedPrefNetwork.saveToken(email: userInfo.email!, token: response.data!);
      emit(LoginSuccessState(successMessage: response.message));
    } else {
      emit(LoginErrorState(errorMessage: response.message));
    }
  }

  Future<UserCredential?> loginWithGoogle() async {
    emit(LoginLoadingState());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginWithGoogleCancelState());
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      emit(LoginWithGoogleSuccessState(successMessage: 'Logged in with google successfully'));
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(LoginWithGoogleErrorState(errorMessage: e.toString()));
      return null;
    }
  }
}
