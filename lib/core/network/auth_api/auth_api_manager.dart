import 'dart:convert';

import 'package:movies_app/core/network/auth_api/auth_api_constants.dart';
import 'package:movies_app/core/network/auth_api/auth_end_points.dart';
import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/data/login/model/login_response.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_request.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_response.dart';
import 'package:http/http.dart' as http;
import '../../../features/update_profile/data/model/update_profile_response.dart';

class AuthApiManager {
  Future<RegisterResponse> register(UserRequest userInfo) async {
    Uri url = Uri.https(AuthApiConstants.baseUrl, AuthEndPoints.registerEndPoint);

    try {
      var response = await http.post(
        url,
        // sent user data then convert it to json code by jsonEncode function
        body: jsonEncode(userInfo.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      var json = jsonDecode(response.body);

      return RegisterResponse.fromJson(json)..statusCode = response.statusCode;
    } catch (e) {
      throw Exception("Register failed: $e");
    }
  }

  Future<LoginResponse> login(LoginRequest userInfo) async {
    Uri url = Uri.https(AuthApiConstants.baseUrl, AuthEndPoints.loginEndPoint);

    try {
      var response = await http.post(
        url,
        body: jsonEncode(userInfo.toJson()),
        headers: {"Content-Type": "application/json"},
      );

      var json = jsonDecode(response.body);
      return LoginResponse.fromJson(json)..statusCode = response.statusCode;
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  Future<Map<String, dynamic>> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) async {
    final url = Uri.https(AuthApiConstants.baseUrl, AuthEndPoints.resetPassword);

    final response = await http.patch(
      url,
      headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
      body: jsonEncode({"oldPassword": oldPassword, "newPassword": newPassword}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }

  Future<UpdateProfileResponse?> updateProfile({String? name, String? phone, int? avaterId}) async {
    Uri url = Uri.https(AuthApiConstants.baseUrl, AuthEndPoints.profile);
    try {
      var response = await http.patch(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthApiConstants.token}",
        },
        body: jsonEncode({"name": name, "phone": phone, "avaterId": avaterId}),
      );

      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return UpdateProfileResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateProfileResponse?> deleteProfile() async {
    Uri url = Uri.https(AuthApiConstants.baseUrl, AuthEndPoints.profile);
    try {
      var response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthApiConstants.token}",
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
