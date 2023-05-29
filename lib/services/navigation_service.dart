import 'package:get/get.dart';
import 'package:symphony_desktop/routes/app_routes.dart';

class NavigationService extends GetxService {
  final Rx<String> _currentRoute = Rx(AppRoutes.initial);

  //getters
  String get getCurrentRoute => _currentRoute.value;

  void toNamed(String page) {
    Get.toNamed(page);
    _currentRoute.value = Get.currentRoute;
  }

  void back() {
    Get.back();
    _currentRoute.value = Get.currentRoute;
  }
}
