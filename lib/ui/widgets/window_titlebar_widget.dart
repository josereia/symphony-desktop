import 'dart:io';
import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class WindowsTitlebarWidget extends StatelessWidget {
  const WindowsTitlebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return WindowTitleBarBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MoveWindow(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: metrics.borderRadius / 2,
            ),
            child: BackdropFilter(
              blendMode: BlendMode.src,
              filter: ImageFilter.blur(
                sigmaX: metrics.blurAmount / 2,
                sigmaY: metrics.blurAmount / 2,
              ),
              child: ColoredBox(
                color: colors.background,
                child: Row(
                  children: [
                    MinimizeWindowButton(
                      animate: true,
                      colors: WindowButtonColors(
                        iconNormal: colors.text,
                      ),
                    ),
                    MaximizeWindowButton(
                      animate: true,
                      colors: WindowButtonColors(
                        iconNormal: colors.text,
                      ),
                    ),
                    CloseWindowButton(
                      animate: true,
                      colors: WindowButtonColors(
                        iconNormal: colors.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WindowTitlebarWidget extends StatelessWidget {
  const WindowTitlebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return const WindowsTitlebarWidget();
    }

    return Container();
  }
}
