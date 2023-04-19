import 'package:get/get.dart';
import 'package:symphony_desktop/bindings/search_page_binding.dart';
import 'package:symphony_desktop/routes/app_routes.dart';
import 'package:symphony_desktop/ui/pages/library_page.dart';
import 'package:symphony_desktop/ui/pages/search_page.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: AppRoutes.library,
      page: () => const LibraryPage(),
    ),
  ];
}
