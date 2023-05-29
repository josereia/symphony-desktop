import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/backdrop_blur_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String? title;
  final Widget? child;

  const HeaderWidget({
    super.key,
    this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return BackdropBlurWidget(
      child: Container(
        height: metrics.headerSize.height,
        padding: EdgeInsets.symmetric(horizontal: metrics.padding),
        decoration: BoxDecoration(
          color: colors.sidebar,
          border: Border(
            bottom: BorderSide(
              color: colors.border,
              width: metrics.borderWidth,
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned.fill(child: Container(child: child)),
            Visibility(
              visible: title != null,
              child: TextWidget(
                title ?? "",
                size: TextWidgetSizes.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
