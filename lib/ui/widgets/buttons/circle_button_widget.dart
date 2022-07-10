import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;

  const CircleButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
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
      fillColor: backgroundColor ?? Theme.of(context).colorScheme.secondary.withAlpha(60),
      onPressed: onPressed,
      child: Center(
        child: Icon(
          icon,
          color: color ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
