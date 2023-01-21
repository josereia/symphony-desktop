import 'package:get/get.dart';
import 'package:symphony_desktop/bindings/pages/home_page_binding.dart';
import 'package:symphony_desktop/ui/pages/favorites_page.dart';
import 'package:symphony_desktop/ui/pages/home_page.dart';
import 'package:symphony_desktop/ui/pages/library_page.dart';
import 'package:symphony_desktop/ui/pages/search_page.dart';
import 'package:symphony_desktop/ui/pages/see_more_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const HomePage(),
      participatesInRootNavigator: true,
      fullscreenDialog: true,
      binding: HomePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      participatesInRootNavigator: true,
      fullscreenDialog: true,
      binding: HomePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.library,
      page: () => const LibraryPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.favorites,
      page: () => const FavoritesPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.seeMore,
      page: () => SeeMore(),
      transition: Transition.fade,
      preventDuplicates: true,
      fullscreenDialog: true,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
