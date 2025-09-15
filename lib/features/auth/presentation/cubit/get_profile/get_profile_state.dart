import 'package:movies_app/features/auth/data/get_profile/model/get_profile_response.dart';

abstract class GetProfileState {}

class GetProfileInitail extends GetProfileState {}

class GetProfileErrorState extends GetProfileState {
  String errorMessage;

  GetProfileErrorState({required this.errorMessage});
}

class GetProfileSuccessState extends GetProfileState {
  GetProfileResponse response;

  GetProfileSuccessState({required this.response});
}
