import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class BackdropBlurWidget extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadius;

  const BackdropBlurWidget({
    super.key,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return ClipRRect(
      child: BackdropFilter(
        blendMode: BlendMode.src,
        filter: ImageFilter.blur(
          sigmaX: metrics.blurAmount,
          sigmaY: metrics.blurAmount,
        ),
        child: child,
      ),
    );
  }
}
