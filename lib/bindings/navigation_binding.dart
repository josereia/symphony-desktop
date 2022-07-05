import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}
