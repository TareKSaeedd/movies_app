import 'package:movies_app/core/network/auth_api/auth_api_manager.dart';
import 'package:movies_app/features/auth/data/get_profile/data_source/get_profile_data_source.dart';
import 'package:movies_app/features/auth/data/get_profile/model/get_profile_response.dart';

class GetProfileDataSourceImpl implements GetProfileDataSource {
  AuthApiManager apiManager = AuthApiManager();
  GetProfileDataSourceImpl({required this.apiManager});
  @override
  Future<GetProfileResponse?> getProfile(String token) {
    var response = apiManager.getProfile(token);

    return response;
  }
}
