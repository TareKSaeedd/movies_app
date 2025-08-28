import 'dart:convert';
import 'package:http/http.dart' as http;

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

}
