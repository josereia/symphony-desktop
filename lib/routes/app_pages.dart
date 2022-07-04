import 'package:get/get.dart';
import 'package:symphony_desktop/ui/pages/albums_page.dart';
import 'package:symphony_desktop/ui/pages/root_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const RootPage(),
    ),
    GetPage(
      name: AppRoutes.albumsPage,
      page: () => const AlbumsPage(),
    )
  ];
}
