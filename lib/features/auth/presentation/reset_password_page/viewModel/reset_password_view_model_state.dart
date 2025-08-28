part of 'reset_password_view_model_cubit.dart';

abstract class ResetPasswordViewModelState {}


class ResetPasswordViewModelInitial extends ResetPasswordViewModelState {}
class ResetPasswordToggleVisibility extends ResetPasswordViewModelState {}

class ResetPasswordLoading extends ResetPasswordViewModelState {}

class ResetPasswordSuccess extends ResetPasswordViewModelState {
  final String message;
  ResetPasswordSuccess(this.message);
}

class ResetPasswordError extends ResetPasswordViewModelState {
  final String error;
  ResetPasswordError(this.error);
}