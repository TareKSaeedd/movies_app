
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalizationPreferencesService {
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
class OnBoardingPreferencesService{

  Future<void> setShowOnBoard(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnBoard' ,value);
  }
  static Future<void>hideOnBoarding()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnBoard' ,false);
  }
  static Future<bool> getShowOnBoard() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('showOnBoard')?? true;
  }

}