
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/services/cubit/language_state.dart';

import '../shared_prefrencies_services/preferences_service.dart';

class LanguageCubit extends Cubit<LanguageState>{
  final LocalizationPreferencesService prefsService;
  LanguageCubit(this.prefsService,Locale locale):super(LanguageInitial(locale));
  void changeLanguage(Locale newLocale){
    emit(LanguageChanged(newLocale));
    prefsService.setLanguage(newLocale);
  }
}