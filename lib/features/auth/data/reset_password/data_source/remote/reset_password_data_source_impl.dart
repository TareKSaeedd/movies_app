import 'package:movies_app/core/network/auth_api/api_manager.dart';
import 'package:movies_app/features/auth/data/reset_password/data_source/remote/reset_password_data_source.dart';

class ResetPasswordDataSourceImpl implements ResetPasswordDataSource {
  ApiManager apiManager;
  ResetPasswordDataSourceImpl({required this.apiManager});

  @override
  Future<Map<String, dynamic>> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) async {
    // TODO: implement resetPassword

    return await apiManager.resetPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      token: token,
    );
  }
}
