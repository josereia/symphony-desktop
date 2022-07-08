import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    colorSchemeSeed: const Color(0xff4D3FC6),
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
          headlineLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
        .apply(
          bodyColor: const Color(0xff27243B),
          displayColor: const Color(0xff27243B),
        ),
  );

  ThemeData getTheme() {
    return theme.copyWith(
      iconTheme: IconThemeData(
        size: 20,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}

class DarkTheme {
  ThemeData theme = ThemeData(
    colorSchemeSeed: const Color(0xff4D3FC6),
    //scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
          headlineLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
        .apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
  );

  ThemeData getTheme() {
    return theme.copyWith(
      iconTheme: IconThemeData(
        size: 20,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}
