
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _languageKey='selected_language';

  Future<void> setLanguage(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey ,locale.languageCode);
  }

  Future<Locale> getSelectedLanguage()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final languageCode= prefs.getString(_languageKey );
    return Locale(languageCode ?? 'en');
  }
}