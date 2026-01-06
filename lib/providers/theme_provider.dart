import 'package:evently/core/resources/common_widgets/app_shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  AppSharedPreferences _appSettingsPreferences =
      AppSharedPreferences.getInstance();
  ThemeProvider() {
    _themeMode = _appSettingsPreferences.getCurrentTheme();
  }

  List<ThemeMode> getModes() {
    return [ThemeMode.light, ThemeMode.dark];
  }

  ThemeMode getSelectedThemeMode() {
    return _themeMode;
  }

  void changeTheme(ThemeMode newMode) {
    _themeMode = newMode;
    _appSettingsPreferences.saveTheme(_themeMode);
    notifyListeners();
  }
}
