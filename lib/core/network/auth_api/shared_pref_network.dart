import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefNetwork {
  static const String tokenKeyPrefix = "user_token_";
  static const String currentUserEmailKey = "current_user_email";

  static Future<void> saveToken({required String email, required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("$tokenKeyPrefix$email", token);

    await prefs.setString(currentUserEmailKey, email);
  }

  static Future<String?> getTokenForEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("$tokenKeyPrefix$email");
  }

  static Future<String?> getCurrentUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(currentUserEmailKey);
    if (email == null) return null;
    return prefs.getString("$tokenKeyPrefix$email");
  }
}
