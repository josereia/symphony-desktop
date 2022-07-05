import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      splashColor: Theme.of(context).colorScheme.primary.withAlpha(40),
      shape: const CircleBorder(),
      fillColor: Theme.of(context).colorScheme.secondary.withAlpha(60),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
