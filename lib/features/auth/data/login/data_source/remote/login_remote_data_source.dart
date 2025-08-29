abstract class LoginRemoteDataSource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });
}
