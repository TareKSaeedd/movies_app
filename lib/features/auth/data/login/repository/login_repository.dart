import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/data/login/model/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginRequest userInfo);
}
