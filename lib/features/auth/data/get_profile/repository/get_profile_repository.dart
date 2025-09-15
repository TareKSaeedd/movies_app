import 'package:movies_app/features/auth/data/get_profile/model/get_profile_response.dart';

abstract class GetProfileRepository {
  Future<GetProfileResponse?> getProfile(String token);
}
