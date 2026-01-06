import 'package:evently/core/resources/common_widgets/app_shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale _locale;

  final AppSharedPreferences _appSettingsPreferences =
      AppSharedPreferences.getInstance();
  LanguageProvider() {
    _locale = _appSettingsPreferences.getCurrentLocale();
  }

  List<Locale> getSupportedLocals() {
    return [Locale('en'), Locale('ar')];
  }

  Locale getSelectedLocale() {
    return _locale;
  }

  void changeLocale(Locale newLang) {
    _locale = newLang;
    _appSettingsPreferences.saveLocale(_locale);

    notifyListeners();
  }
}
