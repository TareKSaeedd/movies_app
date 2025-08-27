import 'package:movies_app/features/auth/data/register/model/register_model_request.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_response.dart';

abstract class RegisterDataSource {
  Future<RegisterResponse> register(UserRequest userInfo);
}
