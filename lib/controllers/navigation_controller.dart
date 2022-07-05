import 'package:get/get.dart';
import 'package:symphony_desktop/routes/app_pages.dart';

class NavigationController extends GetxController {
  final RxInt _index = 0.obs;
  final RxString _currentRoute = AppRoutes.initial.obs;

  int get getIndex => _index.value;
  String get getCurrentRoute => _currentRoute.value;

  void setIndex(int value) {
    _index.value = value;
  }

  void setCurrentRoute(String? route) {
    _currentRoute.value = route ?? "";
  }
}
