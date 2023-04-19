import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

abstract class AppLightTheme {
  static final ThemeColors colors = ThemeColors(
    primary: const Color(0xFF4D3FC6),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFF2F2F2).withOpacity(0.8),
    onSecondary: const Color(0xFF000000),
    sidebar: const Color(0xFFFFFFFF).withOpacity(0.8),
    onSidebar: const Color(0xFF000000),
    border: const Color(0xFFE5E5E5),
    shadow: const Color(0xFF000000).withOpacity(0.2),
    text: const Color(0xFF000000),
    textContrast: const Color(0xFFFFFFFF),
    background: const Color(0xFFFFFFFF),
    onBackground: const Color(0xFF000000),
  );

  static ThemeData baseTheme = ThemeData(brightness: Brightness.light);
}
