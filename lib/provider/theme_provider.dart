import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Current theme data
  ThemeData _themeData;

  // Constructor initializes with a default theme
  ThemeProvider() : _themeData = _lightTheme;

  // Getter for the current theme
  ThemeData get themeData => _themeData;

  // Light theme
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.blueGrey, // Custom background color
    ),
    scaffoldBackgroundColor: Colors.blueGrey, // Ensure it's consistent
  );

  // Dark theme
  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Colors.black54, // Custom background color
    ),
    scaffoldBackgroundColor: Colors.black54, // Ensure it's consistent
  );

  // Switch to light theme
  void setLightTheme() {
    _themeData = _lightTheme;
    notifyListeners(); // Notify widgets to rebuild
  }

  // Switch to dark theme
  void setDarkTheme() {
    _themeData = _darkTheme;
    notifyListeners(); // Notify widgets to rebuild
  }
}
