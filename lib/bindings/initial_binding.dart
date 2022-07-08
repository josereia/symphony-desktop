import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';
import 'package:symphony_desktop/controllers/player_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<PlayerController>(() => PlayerController());
  }
}
