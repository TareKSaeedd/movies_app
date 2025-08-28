import 'package:movies_app/features/update_profile/data/model/update_profile_response.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponse response;
  UpdateProfileSuccess(this.response);
}

class UpdateProfileError extends UpdateProfileState {
  final String error;
  UpdateProfileError(this.error);
}

class DeleteProfileLoading extends UpdateProfileState {}

class DeleteProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponse response;
  DeleteProfileSuccess(this.response);
}

class DeleteProfileError extends UpdateProfileState {
  final String error;
  DeleteProfileError(this.error);
}