import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

abstract class AppDarkTheme {
  static final ThemeColors colors = ThemeColors(
    primary: const Color(0xFF635AB8),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFF242424).withOpacity(0.8),
    onSecondary: const Color(0xFFFFFFFF),
    sidebar: const Color(0xFF000000).withOpacity(0.8),
    onSidebar: const Color(0xFFFFFFFF),
    border: const Color(0xFF222222),
    shadow: const Color(0xFF242424).withOpacity(0.2),
    text: const Color(0xFFFFFFFF),
    textContrast: const Color(0xFF000000),
    background: const Color(0xFF000000),
    onBackground: const Color(0xFFFFFFFF),
  );

  static ThemeData baseTheme = ThemeData(brightness: Brightness.dark);
}
