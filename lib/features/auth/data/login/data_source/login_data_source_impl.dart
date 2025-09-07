import 'package:movies_app/core/network/auth_api/auth_api_manager.dart';
import 'package:movies_app/features/auth/data/login/data_source/login_data_source.dart';
import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/data/login/model/login_response.dart';

class LoginDataSourceImpl implements LoginDataSource {
  AuthApiManager apiManager;

  LoginDataSourceImpl({required this.apiManager});

  @override
  Future<LoginResponse> login(LoginRequest userInfo) {
    var response = apiManager.login(userInfo);

    return response;
  }
}
