import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

enum GapWidgetDirections {
  horizontal,
  vertical,
}

enum GapWidgetSizes {
  normal,
  small,
}

class GapWidget extends StatelessWidget {
  final GapWidgetDirections direction;
  final GapWidgetSizes size;

  const GapWidget({
    super.key,
    required this.direction,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    late double gap;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    if (size == GapWidgetSizes.normal) {
      gap = metrics.gap;
    } else {
      gap = metrics.smallGap;
    }

    return Visibility(
      visible: direction == GapWidgetDirections.horizontal,
      replacement: SizedBox(height: gap),
      child: SizedBox(width: gap),
    );
  }
}
