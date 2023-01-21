import 'dart:ui';
import 'package:flutter/material.dart';

@immutable
class ThemeMetrics extends ThemeExtension<ThemeMetrics> {
  final EdgeInsets padding;
  final double gap;
  final double headerHeight;
  final BorderRadius borderRadius;
  final double elevation;
  final BorderRadius fieldBorderRadius;
  final BorderRadius buttonBorderRadius;
  final EdgeInsets buttonPadding;
  final EdgeInsets fieldPadding;

  const ThemeMetrics({
    required this.padding,
    required this.gap,
    required this.headerHeight,
    required this.borderRadius,
    required this.elevation,
    required this.fieldBorderRadius,
    required this.buttonBorderRadius,
    required this.buttonPadding,
    required this.fieldPadding,
  });

  @override
  ThemeMetrics copyWith({
    EdgeInsets? padding,
    double? gap,
    double? headerHeight,
    BorderRadius? borderRadius,
    double? elevation,
    BorderRadius? fieldBorderRadius,
    BorderRadius? buttonBorderRadius,
    EdgeInsets? buttonPadding,
    EdgeInsets? fieldPadding,
  }) {
    return ThemeMetrics(
      padding: padding ?? this.padding,
      gap: gap ?? this.gap,
      headerHeight: headerHeight ?? this.headerHeight,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      fieldBorderRadius: fieldBorderRadius ?? this.fieldBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      fieldPadding: fieldPadding ?? this.fieldPadding,
    );
  }

  @override
  ThemeMetrics lerp(covariant ThemeExtension<ThemeMetrics>? other, double t) {
    if (other is! ThemeMetrics) {
      return this;
    }

    return ThemeMetrics(
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      headerHeight: lerpDouble(headerHeight, other.headerHeight, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
      buttonPadding: EdgeInsets.lerp(buttonPadding, other.buttonPadding, t)!,
      fieldPadding: EdgeInsets.lerp(fieldPadding, other.fieldPadding, t)!,
      fieldBorderRadius: BorderRadius.lerp(
        fieldBorderRadius,
        other.fieldBorderRadius,
        t,
      )!,
      buttonBorderRadius: BorderRadius.lerp(
        buttonBorderRadius,
        other.buttonBorderRadius,
        t,
      )!,
    );
  }

  double? toDouble(EdgeInsets? padding) {
    return padding?.top.toDouble();
  }
}

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color primaryBorder;
  final Color onPrimary;
  final Color secondary;
  final Color secondaryBorder;
  final Color onSecondary;
  final Color error;
  final Color errorBorder;
  final Color onError;
  final Color success;
  final Color sucessBorder;
  final Color onSuccess;
  final Color warning;
  final Color warningBorder;
  final Color onWarning;
  final Color text;
  final Color background;

  const ThemeColors({
    required this.primary,
    required this.primaryBorder,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryBorder,
    required this.onSecondary,
    required this.error,
    required this.errorBorder,
    required this.onError,
    required this.success,
    required this.sucessBorder,
    required this.onSuccess,
    required this.warning,
    required this.warningBorder,
    required this.onWarning,
    required this.text,
    required this.background,
  });

  @override
  ThemeColors copyWith({
    Color? primary,
    Color? primaryBorder,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryBorder,
    Color? onSecondary,
    Color? error,
    Color? errorBorder,
    Color? onError,
    Color? success,
    Color? sucessBorder,
    Color? onSuccess,
    Color? warning,
    Color? warningBorder,
    Color? onWarning,
    Color? text,
    Color? background,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      primaryBorder: primaryBorder ?? this.primaryBorder,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      secondaryBorder: secondaryBorder ?? this.secondaryBorder,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      errorBorder: errorBorder ?? this.errorBorder,
      onError: onError ?? this.onError,
      success: success ?? this.success,
      sucessBorder: sucessBorder ?? this.sucessBorder,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      warningBorder: warningBorder ?? this.warningBorder,
      onWarning: onWarning ?? this.onWarning,
      text: text ?? this.text,
      background: background ?? this.background,
    );
  }

  @override
  ThemeColors lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryBorder: Color.lerp(primaryBorder, other.primaryBorder, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryBorder: Color.lerp(secondaryBorder, other.secondaryBorder, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      success: Color.lerp(success, other.success, t)!,
      sucessBorder: Color.lerp(sucessBorder, other.sucessBorder, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningBorder: Color.lerp(warningBorder, other.warningBorder, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      text: Color.lerp(text, other.text, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
