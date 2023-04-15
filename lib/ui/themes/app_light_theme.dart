import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

abstract class AppLightTheme {
  static final ThemeColors colors = ThemeColors(
    primary: const Color(0xFF4D3FC6),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFC4C4C4),
    onSecondary: const Color(0xFF000000),
    sidebar: const Color(0xFFFFFFFF).withOpacity(0.1),
    onSidebar: const Color(0xFF000000),
    border: const Color(0xFF666666),
    shadow: const Color(0xFF000000).withOpacity(0.2),
    text: const Color(0xFF27243B),
    textContrast: const Color(0xFFFFFFFF),
    background: const Color(0xFFFFFFFF),
    onBackground: const Color(0xFF000000),
  );

  static ThemeData baseTheme = ThemeData(brightness: Brightness.light);
}
