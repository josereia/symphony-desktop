import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowTitlebarWidget extends StatelessWidget {
  const WindowTitlebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: MoveWindow(),
          ),
          MinimizeWindowButton(animate: true),
          MaximizeWindowButton(animate: true),
          CloseWindowButton(animate: true),
        ],
      ),
    );
  }
}
