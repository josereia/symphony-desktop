import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/theme/app_theme_extensions.dart';
import 'package:symphony_desktop/ui/widgets/player_widget.dart';
import 'package:symphony_desktop/ui/widgets/sidebar_widget.dart';

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return ColoredBox(
      color: colors.background,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(child: MoveWindow()),
            Row(
              children: [
                MinimizeWindowButton(
                  colors: WindowButtonColors(
                    iconNormal: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                MaximizeWindowButton(
                  colors: WindowButtonColors(
                    iconNormal: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                CloseWindowButton(
                  colors: WindowButtonColors(
                    iconNormal: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppBuilderWidget extends StatelessWidget {
  final Widget? child;

  const AppBuilderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          SidebarWidget(),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Platform.isLinux == false ? _HeaderWidget() : Container(),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      child ?? Container(),
                      const Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: PlayerWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
