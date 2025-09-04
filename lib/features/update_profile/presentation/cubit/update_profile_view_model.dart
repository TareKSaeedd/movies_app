import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/update_profile/data/repository/update_profile_repository.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'update_profile_state.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository repository;
  int? selectedAvatarId;
  var formKey = GlobalKey<FormState>();

  UpdateProfileViewModel({required this.repository}) : super(UpdateProfileInitial());

  void setAvatar(int avaterId){
    selectedAvatarId = avaterId;
  }
 

  Future<void> updateProfile({String? name, String? phone, int? avaterId,required BuildContext context}) async {
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
        emit(UpdateProfileError(AppLocalizations.of(context)!.no_response_from_server));
      }
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteProfile({required BuildContext context}) async {
    emit(DeleteProfileLoading());
    try {
      final response = await repository.deleteProfile();
      if (response != null) {
        emit(DeleteProfileSuccess(response));
      } else {
        emit(DeleteProfileError(AppLocalizations.of(context)!.no_response_from_server));
      }
    } catch (e) {
      emit(DeleteProfileError(e.toString()));
    }
  }
}