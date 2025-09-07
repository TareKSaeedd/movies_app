import 'package:movies_app/core/network/auth_api/auth_api_manager.dart';
import 'package:movies_app/features/update_profile/data/model/update_profile_response.dart';
import 'update_profile_remote_data_source.dart';

class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource {
  final AuthApiManager apiManager;

  UpdateProfileRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<UpdateProfileResponse?> updateProfile({String? name, String? phone, int? avaterId}) async {
    var response = await apiManager.updateProfile(name: name, phone: phone, avaterId: avaterId);
    return response;
  }

  @override
  Future<UpdateProfileResponse?> deleteProfile() {
    return apiManager.deleteProfile();
  }
}
