import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class ButtonWidget extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;

  const ButtonWidget({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.all(metrics.buttonRadius),
        child: Ink(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.all(metrics.buttonRadius),
          ),
          child: Icon(
            icon,
            color: colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
