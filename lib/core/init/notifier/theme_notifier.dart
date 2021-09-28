import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/enums/app_theme_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData(brightness: Brightness.light);
  AppThemes _currentThemeEnum = AppThemes.light;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.light]
  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.light) {
      _currentThemeEnum = AppThemes.light;
      _currentTheme = ThemeData.light();
    } else {
      _currentThemeEnum = AppThemes.dark;
      //_currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.light) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemes.dark;
    } else {
      _currentTheme =  ThemeData.light();
      _currentThemeEnum = AppThemes.light;
    }
    notifyListeners();
  }
}
