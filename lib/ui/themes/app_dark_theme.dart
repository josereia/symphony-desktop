import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

abstract class AppDarkTheme {
  static final ThemeColors colors = ThemeColors(
    primary: const Color(0xFF948DD6).withOpacity(0.94),
    onPrimary: const Color(0xFF000000),
    secondary: const Color(0xFF242424).withOpacity(0.84),
    onSecondary: const Color(0xFFFFFFFF),
    sidebar: const Color(0xFF000000).withOpacity(0.84),
    onSidebar: const Color(0xFFFFFFFF),
    border: const Color(0xFFFFFFFF).withOpacity(0.1),
    shadow: const Color(0xFF242424).withOpacity(0.2),
    text: const Color(0xFFFFFFFF),
    textContrast: const Color(0xFF000000),
    background: const Color(0xFF000000).withOpacity(0.94),
    onBackground: const Color(0xFFFFFFFF),
  );

  static ThemeData baseTheme = ThemeData(brightness: Brightness.dark);
}
