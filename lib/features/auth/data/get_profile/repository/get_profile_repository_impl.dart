import 'package:movies_app/features/auth/data/get_profile/data_source/get_profile_data_source.dart';
import 'package:movies_app/features/auth/data/get_profile/model/get_profile_response.dart';
import 'package:movies_app/features/auth/data/get_profile/repository/get_profile_repository.dart';

class GetProfileRepositoryImpl implements GetProfileRepository {
  GetProfileDataSource getProfileDataSource;
  GetProfileRepositoryImpl({required this.getProfileDataSource});
  @override
  Future<GetProfileResponse?> getProfile(String token) {
    return getProfileDataSource.getProfile(token);
  }
}
