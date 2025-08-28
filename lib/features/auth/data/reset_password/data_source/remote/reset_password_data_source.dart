abstract class ResetPasswordDataSource{
  Future<Map<String, dynamic>> resetPassword(
      {
        required String oldPassword,
        required String newPassword,
        required String token,
      }
      );
}