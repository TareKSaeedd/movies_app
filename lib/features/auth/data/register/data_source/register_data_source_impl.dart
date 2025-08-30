import 'package:movies_app/core/network/auth_api/api_manager.dart';
import 'package:movies_app/features/auth/data/register/data_source/register_data_source.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_request.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_response.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  ApiManager apiManager;

  RegisterDataSourceImpl({required this.apiManager});
  @override
  Future<RegisterResponse> register(UserRequest userInfo) {
    var response = apiManager.register(userInfo);

    return response;
  }
}
