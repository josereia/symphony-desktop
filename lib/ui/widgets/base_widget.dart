import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/widgets/sidebar/sidebar_widget.dart';

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
            child: child ?? Container(),
          ),
        ],
      ),
    );
  }
}
