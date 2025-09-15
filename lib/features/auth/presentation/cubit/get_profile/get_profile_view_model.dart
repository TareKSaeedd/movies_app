import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/auth_api/shared_pref_network.dart';
import 'package:movies_app/features/auth/data/get_profile/repository/get_profile_repository.dart';
import 'package:movies_app/features/auth/presentation/cubit/get_profile/get_profile_state.dart';

class GetProfileViewModel extends Cubit<GetProfileState> {
  GetProfileRepository getProfileRepository;
  GetProfileViewModel({required this.getProfileRepository}) : super(GetProfileInitail());

  // hold data - handle logic

  String? userName;

  Future<void> getProfile() async {
    final token = await SharedPrefNetwork.getCurrentUserToken();
    try {
      var response = await getProfileRepository.getProfile(token!);
      userName = response?.data?.name ?? '';
      emit(GetProfileSuccessState(response: response!));
    } on Exception catch (e) {
      emit(GetProfileErrorState(errorMessage: e.toString()));
    }
  }
}
