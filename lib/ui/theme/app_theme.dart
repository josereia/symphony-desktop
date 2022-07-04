import 'package:flutter/material.dart';

class LightTheme {
  getTheme() {
    return ThemeData(
      colorSchemeSeed: const Color(0xff4D3FC6),
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }
}

class DarkTheme {
  getTheme() {
    return ThemeData(
      colorSchemeSeed: const Color(0xff4D3FC6),
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}
