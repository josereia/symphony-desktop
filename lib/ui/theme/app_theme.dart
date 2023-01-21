import 'package:symphony_desktop/ui/theme/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final bool isDark;

  static const _lightColors = ThemeColors(
    primary: Color(0xff4D3FC6),
    primaryBorder: Color(0xFF0093C4),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF2F2F2),
    secondaryBorder: Color(0xFFE4E4E4),
    onSecondary: Color(0xFF282828),
    error: Color(0xFFA10000),
    errorBorder: Color(0xFFB92013),
    onError: Color(0xFFFFFFFF),
    success: Color(0xFF00875A),
    sucessBorder: Color(0xFF1EAE54),
    onSuccess: Color(0xFFFFFFFF),
    warning: Color(0xFFFCC936),
    warningBorder: Color(0xFFC99603),
    onWarning: Color(0xFF3D3D3D),
    text: Colors.black,
    background: Colors.white,
  );

  static const _darkColors = ThemeColors(
    primary: Color(0xff4D3FC6),
    primaryBorder: Color(0xFF0093C4),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color.fromARGB(255, 40, 40, 40),
    secondaryBorder: Color.fromARGB(255, 50, 50, 50),
    onSecondary: Color(0xFFFFFFFF),
    error: Color.fromARGB(255, 176, 37, 24),
    errorBorder: Color.fromARGB(255, 136, 26, 16),
    onError: Color(0xFFFFFFFF),
    success: Color.fromARGB(255, 23, 141, 67),
    sucessBorder: Color.fromARGB(255, 15, 95, 45),
    onSuccess: Color(0xFFFFFFFF),
    warning: Color(0xFFFCC936),
    warningBorder: Color(0xFFC99603),
    onWarning: Color(0xFFFFFFFF),
    text: Colors.white,
    background: Colors.black,
  );

  static final _metrics = ThemeMetrics(
    padding: const EdgeInsets.all(16),
    gap: 16,
    headerHeight: 60,
    borderRadius: BorderRadius.circular(8),
    elevation: 24,
    fieldBorderRadius: BorderRadius.circular(6),
    buttonBorderRadius: BorderRadius.circular(6),
    buttonPadding: const EdgeInsets.symmetric(
      vertical: 6,
      horizontal: 8,
    ),
    fieldPadding: const EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 16,
    ),
  );

  AppTheme({required this.isDark});

  late final _theme = ThemeData(
    useMaterial3: false,
    visualDensity: VisualDensity.compact,
    extensions: <ThemeExtension<dynamic>>[
      _metrics,
      isDark ? _darkColors : _lightColors,
    ],
  );

  ThemeData getTheme() {
    final ThemeColors colors = _theme.extension<ThemeColors>()!;

    return _theme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ).copyWith(
        primary: colors.primary,
        error: colors.error,
        surface: colors.background,
        background: colors.background,
        surfaceTint: Colors.transparent,
        shadow: Colors.black.withOpacity(0.4),
      ),
      primaryColor: colors.primary,
      cardColor: colors.background,
      scaffoldBackgroundColor: colors.background,
      dialogBackgroundColor: colors.background,
      hoverColor: colors.secondary,
      backgroundColor: colors.background,
      splashColor: colors.secondaryBorder,
      dividerColor: colors.secondaryBorder,
      iconTheme: IconThemeData(color: colors.text, size: 20),
      cardTheme: CardTheme(
        color: colors.background,
        surfaceTintColor: colors.background,
      ),
      textTheme: GoogleFonts.robotoTextTheme(_theme.textTheme)
          .copyWith(
            headlineLarge: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            headlineMedium: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            headlineSmall: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            titleLarge: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            titleMedium: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            titleSmall: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
          .apply(
            bodyColor: colors.text,
            displayColor: colors.text,
          ),
    );
  }
}
