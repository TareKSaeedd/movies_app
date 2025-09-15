import 'package:movies_app/core/network/auth_api/auth_api_manager.dart';
import 'package:movies_app/features/auth/data/get_profile/data_source/get_profile_data_source.dart';
import 'package:movies_app/features/auth/data/get_profile/data_source/get_profile_data_source_impl.dart';
import 'package:movies_app/features/auth/data/get_profile/repository/get_profile_repository.dart';
import 'package:movies_app/features/auth/data/get_profile/repository/get_profile_repository_impl.dart';

GetProfileRepository injectgetProfileRepository() {
  return GetProfileRepositoryImpl(getProfileDataSource: injectGetProfileDataSource());
}

GetProfileDataSource injectGetProfileDataSource() {
  return GetProfileDataSourceImpl(apiManager: injectGetProfile());
}

AuthApiManager injectGetProfile() {
  return AuthApiManager();
}
