import 'package:movies_app/features/auth/data/login/data_source/login_data_source.dart';
import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/data/login/model/login_response.dart';
import 'package:movies_app/features/auth/data/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});
  @override
  Future<LoginResponse> login(LoginRequest userInfo) {
    return loginDataSource.login(userInfo);
  }
}
