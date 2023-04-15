import 'package:flutter/material.dart';
import 'package:symphony_desktop/widgets/window_titlebar_widget.dart';

class _WindowContent extends StatelessWidget {
  final Widget child;

  const _WindowContent({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: child,
        ),
      ],
    );
  }
}

class AppBuilder extends StatelessWidget {
  final bool isTransparent;
  final Widget? child;

  const AppBuilder({
    super.key,
    required this.isTransparent,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isTransparent ? Colors.transparent : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: _WindowContent(
              child: Container(
                child: child,
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: WindowTitlebarWidget(),
          ),
        ],
      ),
    );
  }
}
