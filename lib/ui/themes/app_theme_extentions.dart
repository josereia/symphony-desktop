import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color sidebar;
  final Color onSidebar;
  final Color border;
  final Color shadow;
  final Color text;
  final Color textContrast;
  final Color background;
  final Color onBackground;

  const ThemeColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.sidebar,
    required this.onSidebar,
    required this.border,
    required this.shadow,
    required this.text,
    required this.textContrast,
    required this.background,
    required this.onBackground,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? sidebar,
    Color? onSidebar,
    Color? border,
    Color? shadow,
    Color? text,
    Color? textContrast,
    Color? background,
    Color? onBackground,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      sidebar: sidebar ?? this.sidebar,
      onSidebar: onSidebar ?? this.onSidebar,
      border: border ?? this.border,
      shadow: shadow ?? this.shadow,
      text: text ?? this.text,
      textContrast: textContrast ?? this.textContrast,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
      covariant ThemeExtension<ThemeExtension>? other, double t) {
    throw UnimplementedError();
  }
}

class ThemeMetrics extends ThemeExtension<ThemeMetrics> {
  final double padding;
  final double smallPadding;
  final double gap;
  final double smallGap;
  final double borderWidth;
  final double iconSize;
  final Radius borderRadius;
  final Size buttonSize;
  final Radius buttonRadius;
  final Size fieldSize;
  final Radius fieldRadius;
  final Size sidebarSize;
  final Size playerSize;

  const ThemeMetrics({
    required this.padding,
    required this.smallPadding,
    required this.gap,
    required this.smallGap,
    required this.borderWidth,
    required this.iconSize,
    required this.borderRadius,
    required this.buttonSize,
    required this.buttonRadius,
    required this.fieldSize,
    required this.fieldRadius,
    required this.sidebarSize,
    required this.playerSize,
  });

  @override
  ThemeExtension<ThemeMetrics> copyWith({
    double? padding,
    double? smallPadding,
    double? gap,
    double? smallGap,
    double? borderWidth,
    double? iconSize,
    Radius? borderRadius,
    Size? buttonSize,
    Radius? buttonRadius,
    Size? fieldSize,
    Radius? fieldRadius,
    Size? sidebarSize,
    Size? playerSize,
  }) {
    return ThemeMetrics(
      padding: padding ?? this.padding,
      smallPadding: smallPadding ?? this.smallPadding,
      gap: gap ?? this.gap,
      smallGap: smallGap ?? this.smallGap,
      borderWidth: borderWidth ?? this.borderWidth,
      iconSize: iconSize ?? this.iconSize,
      borderRadius: borderRadius ?? this.borderRadius,
      buttonSize: buttonSize ?? this.buttonSize,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      fieldSize: fieldSize ?? this.fieldSize,
      fieldRadius: fieldRadius ?? this.fieldRadius,
      sidebarSize: sidebarSize ?? this.sidebarSize,
      playerSize: playerSize ?? this.playerSize,
    );
  }

  @override
  ThemeExtension<ThemeMetrics> lerp(
      covariant ThemeExtension<ThemeExtension>? other, double t) {
    throw UnimplementedError();
  }
}
