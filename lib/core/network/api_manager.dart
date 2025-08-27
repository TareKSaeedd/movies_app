import 'dart:convert';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/end_points.dart';
import 'package:movies_app/features/update_profile/data/model/update_profile_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<UpdateProfileResponse?> updateProfile({String? name, String? phone, int? avaterId})async{
    Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.profile);
    try {
      var response = await http.patch(url,
      headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${ApiConstants.token}",
      },
      body: jsonEncode({
          "name": name,
          "phone": phone,
          "avaterId": avaterId,
        }),
      );

      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return UpdateProfileResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }


  Future<UpdateProfileResponse?> deleteProfile() async {
  Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.profile);
  try {
    var response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${ApiConstants.token}",
      },
    );

    var responseBody = response.body; 
    var json = jsonDecode(responseBody);
    return UpdateProfileResponse.fromJson(json);
  } catch (e) {
    rethrow;
  }
}
}
