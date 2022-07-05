import 'dart:ui';

import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          height: 100,
          color: const Color.fromARGB(200, 236, 236, 236),
          child: const Center(
            child: Text("Player Widget"),
          ),
        ),
      ),
    );
  }
}
