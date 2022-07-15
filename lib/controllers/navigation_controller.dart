import 'package:get/get.dart';
import 'package:symphony_desktop/routes/app_pages.dart';

class NavigationController extends GetxController {
  final RxString _currentRoute = AppRoutes.initial.obs;

  String get getCurrentRoute => _currentRoute.value;

  void setCurrentRoute(String? route) {
    _currentRoute.value = route ?? "";
  }

  void back() {
    Get.back();
    _currentRoute.value = Get.currentRoute;
  }
}
