import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../features/update_profile/data/model/update_profile_response.dart';
import 'api_constants.dart';
import 'end_points.dart';

class ApiManager {
  Future<Map<String, dynamic>> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) async {
    final url = Uri.https(ApiConstants.baseUrl, EndPoints.resetPassword);

    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }

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
