import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final bool isEnabled;

  const CircleButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: width ?? 40,
        height: height ?? 40,
      ),
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      shape: const CircleBorder(),
      fillColor: isEnabled
          ? backgroundColor ??
              Theme.of(context).colorScheme.secondary.withAlpha(60)
          : Theme.of(context).colorScheme.secondary.withAlpha(50),
      onPressed: isEnabled ? onPressed : null,
      child: Center(
        child: Icon(
          icon,
          color: isEnabled
              ? color ?? Theme.of(context).iconTheme.color
              : Theme.of(context).iconTheme.color?.withAlpha(160),
        ),
      ),
    );
  }
}
