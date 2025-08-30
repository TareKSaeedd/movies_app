import 'package:movies_app/core/network/auth_api/api_manager.dart';
import 'package:movies_app/features/auth/data/reset_password/data_source/remote/reset_password_data_source.dart';
import 'package:movies_app/features/auth/data/reset_password/repository/reset_password_repository.dart';
import 'package:movies_app/features/auth/data/reset_password/repository/reset_password_repository_impl.dart';

import '../data_source/remote/reset_password_data_source_impl.dart';

ResetPasswordRepository injectResetPasswordRepository() {
  return ResetPasswordRepositoryImpl(dataSource: injectResetPasswordDataSource());
}

ResetPasswordDataSource injectResetPasswordDataSource() {
  return ResetPasswordDataSourceImpl(apiManager: injectApiManger());
}

ApiManager injectApiManger() {
  return ApiManager();
}
