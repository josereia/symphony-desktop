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
            child: Stack(
              children: [
                child ?? Container(),
                const Positioned(
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
    );
  }
}
