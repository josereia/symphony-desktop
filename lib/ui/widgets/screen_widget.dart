import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class ScreenWidget extends StatelessWidget {
  final Widget? header;
  final Widget body;
  const ScreenWidget({
    super.key,
    this.header,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(metrics.padding),
            child: body,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: header ?? Container(),
        ),
      ],
    );
  }
}
