import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/theme/app_theme_extensions.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final bool? isEnabled;

  const CircleButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: isEnabled == true ? onPressed : () => {},
            borderRadius: BorderRadius.circular(50),
            enableFeedback: isEnabled == true,
            child: Ink(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isEnabled == true
                    ? colors.text.withOpacity(0.2)
                    : colors.text.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 1,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: isEnabled == true
                      ? colors.text
                      : colors.text.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
