import 'package:movies_app/core/network/auth_api/api_manager.dart';
import 'package:movies_app/features/update_profile/data/data_source/remote/update_profile_remote_data_source.dart';
import 'package:movies_app/features/update_profile/data/data_source/remote/update_profile_remote_data_source_impl.dart';
import 'package:movies_app/features/update_profile/data/repository/update_profile_repository.dart';
import 'package:movies_app/features/update_profile/data/repository/update_profile_repository_impl.dart';

UpdateProfileRepository injectedUpdateProfileRepository() {
  return UpdateProfileRepositoryImpl(
    updateProfileRemoteDataSource: injectUpdateProfileRemoteDataSource(),
  );
}

UpdateProfileRemoteDataSource injectUpdateProfileRemoteDataSource() {
  return UpdateProfileRemoteDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}
