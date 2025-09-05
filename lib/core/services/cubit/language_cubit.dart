
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:movies_app/core/services/cubit/language_state.dart';
import '../prefrences_service.dart';

class LanguageCubit extends Cubit<LanguageState>{
  final PreferencesService prefsService;
  LanguageCubit(this.prefsService,Locale locale):super(LanguageInitial(locale));
  void changeLanguage(Locale newLocale){
    emit(LanguageChanged(newLocale));
    prefsService.setLanguage(newLocale);
  }
}