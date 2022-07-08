import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/widgets/player_widget.dart';
import 'package:symphony_desktop/ui/widgets/sidebar_widget.dart';


class BaseWidget extends StatelessWidget {
  final Widget? child;

  const BaseWidget({super.key, required this.child});

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
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: WindowTitleBarBox(
                    child: Row(
                      children: [
                        Expanded(child: MoveWindow()),
                        Row(
                          children: [
                            MinimizeWindowButton(
                              colors: WindowButtonColors(
                                iconNormal:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            MaximizeWindowButton(
                              colors: WindowButtonColors(
                                iconNormal:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            CloseWindowButton(
                              colors: WindowButtonColors(
                                iconNormal:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
