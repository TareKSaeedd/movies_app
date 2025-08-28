
import 'package:movies_app/features/update_profile/data/model/update_profile_response.dart';

abstract class UpdateProfileRepository {
  Future<UpdateProfileResponse?> updateProfile({
    String? name,
    String? phone,
    int? avaterId,
  });

  Future<UpdateProfileResponse?> deleteProfile();
}