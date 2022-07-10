import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/widgets/player_widget.dart';
import 'package:symphony_desktop/ui/widgets/sidebar_widget.dart';

class AppBuilderWidget extends StatelessWidget {
  final Widget? child;

  const AppBuilderWidget({super.key, required this.child});

  Widget _header(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
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
                Platform.isWindows ? _header(context) : Container(),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      child ?? Container(),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
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
