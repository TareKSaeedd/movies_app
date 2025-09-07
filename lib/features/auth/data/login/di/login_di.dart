import 'package:movies_app/core/network/auth_api/auth_api_manager.dart';
import 'package:movies_app/features/auth/data/login/data_source/login_data_source.dart';
import 'package:movies_app/features/auth/data/login/data_source/login_data_source_impl.dart';
import 'package:movies_app/features/auth/data/login/repository/login_repository.dart';
import 'package:movies_app/features/auth/data/login/repository/login_repository_impl.dart';

LoginRepository injectLoginRepositoyr() {
  return LoginRepositoryImpl(loginDataSource: injectLoginDataSource());
}

LoginDataSource injectLoginDataSource() {
  return LoginDataSourceImpl(apiManager: injectLoginApi());
}

AuthApiManager injectLoginApi() {
  return AuthApiManager();
}
