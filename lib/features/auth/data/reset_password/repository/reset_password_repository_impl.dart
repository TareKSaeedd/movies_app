import 'package:movies_app/features/auth/data/reset_password/repository/reset_password_repository.dart';

import '../data_source/remote/reset_password_data_source.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  ResetPasswordDataSource dataSource;
  ResetPasswordRepositoryImpl({required this.dataSource});

  @override
  Future<Map<String, dynamic>> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) {
    // TODO: implement resetPassword
    return dataSource.resetPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      token: token,
    );
  }
}
