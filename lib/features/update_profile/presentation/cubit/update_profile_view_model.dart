import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/update_profile/data/repository/update_profile_repository.dart';
import 'update_profile_state.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository repository;
  int? selectedAvatarId;
  var formKey = GlobalKey<FormState>();

  UpdateProfileViewModel({required this.repository}) : super(UpdateProfileInitial());

  void setAvatar(int avaterId){
    selectedAvatarId = avaterId;
  }
 

  Future<void> updateProfile({String? name, String? phone, int? avaterId}) async {
    emit(UpdateProfileLoading());
    try {
      final response = await repository.updateProfile(
        name: name,
        phone: phone,
        avaterId: avaterId,
      );
      if (response != null) {
        emit(UpdateProfileSuccess(response));
      } else {
        emit(UpdateProfileError("No response from server"));
      }
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());
    try {
      final response = await repository.deleteProfile();
      if (response != null) {
        emit(DeleteProfileSuccess(response));
      } else {
        emit(DeleteProfileError("No response from server"));
      }
    } catch (e) {
      emit(DeleteProfileError(e.toString()));
    }
  }
}