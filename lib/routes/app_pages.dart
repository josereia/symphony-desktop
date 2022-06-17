import 'package:get/get.dart';
import 'package:symphony_desktop/bindings/root_binding.dart';
import 'package:symphony_desktop/pages/root_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const RootPage(),
      binding: RootBinding(),
    )
  ];
}
