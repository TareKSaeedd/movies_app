import 'dart:convert';

import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/end_points.dart';
import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/data/login/model/login_response.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_request.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_response.dart';

import 'package:http/http.dart' as http;

class ApiManager {
  Future<RegisterResponse> register(UserRequest userInfo) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.registerEndPoint);

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
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.loginEndPoint);

    try {
      var response = await http.post(
        url,
        body: jsonEncode(userInfo.toJson()),
        headers: {"Content-Type": "application/json"},
      );

      var json = jsonDecode(response.body);
      return LoginResponse.fromJson(json)..statusCode = response.statusCode;
    } catch (e) {
      throw e;
    }
  }
}
