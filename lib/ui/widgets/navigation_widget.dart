import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controllers/root_controller.dart';
import 'dart:io';

class NavigationWidget extends StatelessWidget {
  final RootController controller;

  const NavigationWidget({super.key, required this.controller});

  Widget item(Icon icon, Text text, int index) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              controller.getIndex == index ? Colors.white : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 16),
            text,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(kIsWeb ? 255 : Platform.isWindows ? 180 : 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.setIndex(0);
                      },
                      child: item(
                          const Icon(FeatherIcons.home), const Text("Home"), 0),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        controller.setIndex(1);
                      },
                      child: item(const Icon(FeatherIcons.search),
                          const Text("Buscar"), 1),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        controller.setIndex(2);
                      },
                      child: item(const Icon(FeatherIcons.bookOpen),
                          const Text("Biblioteca"), 2),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              child: Image.network(
                  "https://tracklist.com.br/wp-content/uploads/2021/04/olivia-debut.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
