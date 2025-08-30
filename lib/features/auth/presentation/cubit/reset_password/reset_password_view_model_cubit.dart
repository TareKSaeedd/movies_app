import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/auth_api/shared_pref_network.dart';

import 'package:movies_app/features/auth/data/reset_password/repository/reset_password_repository.dart';

part 'reset_password_view_model_state.dart';

class ResetPasswordViewModelCubit extends Cubit<ResetPasswordViewModelState> {
  ResetPasswordRepository resetPasswordRepository;

  ResetPasswordViewModelCubit({required this.resetPasswordRepository})
    : super(ResetPasswordViewModelInitial());

  Future<void> resetPassword({
    required String oldPass,
    required String newPass,
    required String token,
  }) async {
    emit(ResetPasswordLoading());
    final token = await SharedPrefNetwork.getCurrentUserToken();

    if (token == null) {
      emit(ResetPasswordError("No logged in user found"));
      return;
    }

    try {
      final data = await resetPasswordRepository.resetPassword(
        oldPassword: oldPass,
        newPassword: newPass,
        token: token,
      );

      emit(ResetPasswordSuccess(data['message']));
    } catch (e) {
      emit(ResetPasswordError(e.toString()));
    }
  }

  bool showPassword = true;

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    emit(ResetPasswordToggleVisibility());
  }
}
