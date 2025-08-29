import 'login_repository.dart';
import '../data_source/remote/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(email: email, password: password);
  }
}
