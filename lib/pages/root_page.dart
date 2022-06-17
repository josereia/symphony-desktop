import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/root_controller.dart';
import 'package:symphony_desktop/pages/home_page.dart';
import 'package:symphony_desktop/pages/library_page.dart';
import 'package:symphony_desktop/pages/search_page.dart';
import 'package:symphony_desktop/ui/widgets/navigation_widget.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          NavigationWidget(
            controller: controller,
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(
                      () => IndexedStack(
                        index: controller.getIndex,
                        children: const [
                          HomePage(),
                          SearchPage(),
                          LibraryPage(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
