import 'package:movies_app/core/network/auth_api/auth_api_manager.dart';
import 'package:movies_app/features/auth/data/register/data_source/register_data_source.dart';
import 'package:movies_app/features/auth/data/register/data_source/register_data_source_impl.dart';
import 'package:movies_app/features/auth/data/register/repository/register_repository.dart';
import 'package:movies_app/features/auth/data/register/repository/register_repository_impl.dart';

RegisterRepository injectRegisterRepository() {
  return RegisterRepositoryImpl(registerDataSource: injectRegisterDataSource());
}

RegisterDataSource injectRegisterDataSource() {
  return RegisterDataSourceImpl(apiManager: injectApi());
}

AuthApiManager injectApi() {
  return AuthApiManager();
}
