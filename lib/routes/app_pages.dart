import 'package:get/get.dart';
import 'package:symphony_desktop/bindings/database_binding.dart';
import 'package:symphony_desktop/ui/pages/albums_page.dart';
import 'package:symphony_desktop/ui/pages/artists_page.dart';
import 'package:symphony_desktop/ui/pages/favorites_page.dart';
import 'package:symphony_desktop/ui/pages/home_page.dart';
import 'package:symphony_desktop/ui/pages/library_page.dart';
import 'package:symphony_desktop/ui/pages/search_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const HomePage(),
      transition: Transition.noTransition,
      bindings: [DatabaseBinding()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      transition: Transition.noTransition,
      bindings: [DatabaseBinding()],
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
      name: AppRoutes.albums,
      page: () => const AlbumsPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.artists,
      page: () => const ArtistsPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.favorites,
      page: () => const FavoritesPage(),
      transition: Transition.noTransition,
    )
  ];
}
