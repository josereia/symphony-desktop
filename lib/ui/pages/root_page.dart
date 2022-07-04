import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';
import 'package:symphony_desktop/ui/pages/albums_page.dart';
import 'package:symphony_desktop/ui/pages/favorites_page.dart';
import 'package:symphony_desktop/ui/pages/home_page.dart';
import 'package:symphony_desktop/ui/pages/library_page.dart';
import 'package:symphony_desktop/ui/pages/search_page.dart';
import 'package:symphony_desktop/ui/pages/singers_page.dart';

class RootPage extends GetView<NavigationController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.getIndex,
          children: const [
            HomePage(),
            SearchPage(),
            LibraryPage(),
            AlbumsPage(),
            SingersPage(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
