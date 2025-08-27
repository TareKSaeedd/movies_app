import 'package:movies_app/features/update_profile/data/data_source/remote/update_profile_remote_data_source.dart';
import 'package:movies_app/features/update_profile/data/model/update_profile_response.dart';
import 'package:movies_app/features/update_profile/data/repository/update_profile_repository.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository{
  UpdateProfileRemoteDataSource updateProfileRemoteDataSource;
  UpdateProfileRepositoryImpl({required this.updateProfileRemoteDataSource});
  @override
  Future<UpdateProfileResponse?> deleteProfile() {
    return updateProfileRemoteDataSource.deleteProfile();
  }

  @override
  Future<UpdateProfileResponse?> updateProfile({String? name, String? phone, int? avaterId}) {
    return updateProfileRemoteDataSource.updateProfile(name: name, phone: phone, avaterId: avaterId);
  }

}