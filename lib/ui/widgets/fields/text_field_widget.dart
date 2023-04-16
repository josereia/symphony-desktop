import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final void Function(String)? onSubmitted;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.all(metrics.fieldRadius),
      borderSide: BorderSide(color: colors.border),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(metrics.fieldRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: metrics.blurAmmount,
          sigmaY: metrics.blurAmmount,
        ),
        child: SizedBox(
          height: metrics.fieldSize.height,
          child: TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: theme.textTheme.bodyMedium,
              contentPadding: EdgeInsets.symmetric(
                horizontal: metrics.padding,
              ),
              filled: true,
              fillColor: colors.secondary,
              prefixIcon: Icon(
                prefixIcon,
                size: metrics.iconSize,
              ),
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: BorderSide(color: colors.primary),
              ),
              constraints: BoxConstraints(
                maxWidth: metrics.fieldSize.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
