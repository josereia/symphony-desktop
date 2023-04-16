import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final bool? isActive;
  final void Function()? onPressed;

  const IconButtonWidget({
    super.key,
    required this.icon,
    this.isActive,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      icon: Icon(
        icon,
        color: isActive == true ? colors.primary : colors.text,
      ),
    );
  }
}
