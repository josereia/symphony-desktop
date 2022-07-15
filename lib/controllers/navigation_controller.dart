import 'package:get/get.dart';
import 'package:symphony_desktop/routes/app_pages.dart';

class RoutesHistoryModel {
  String route;
  List arguments;

  RoutesHistoryModel({required this.route, required this.arguments});
}

class NavigationController extends GetxController {
  final RxString _currentRoute = AppRoutes.initial.obs;
  final RxList<RoutesHistoryModel> _routesHistory = [
    RoutesHistoryModel(route: AppRoutes.initial, arguments: []),
  ].obs;
  final RxBool _haveNextRoute = false.obs;
  final RxBool _haveBackRoute = false.obs;

  String get getCurrentRoute => _currentRoute.value;
  List get getRoutesHistory => _routesHistory;
  bool get getHaveNextRoute => _haveNextRoute.value;
  bool get getHaveBackRoute => _haveBackRoute.value;

  void _haveMoreRoutesValidation() {
    if (Get.currentRoute == _routesHistory.first.route) {
      _haveBackRoute.value = false;
    } else {
      _haveBackRoute.value = true;
    }

    if (Get.currentRoute == _routesHistory.last.route) {
      _haveNextRoute.value = false;
    } else {
      _haveNextRoute.value = true;
    }
  }

  void toNamed(String route, {List? arguments}) {
    Get.toNamed(route, arguments: arguments);
    _routesHistory
        .add(RoutesHistoryModel(route: route, arguments: arguments ?? []));
    _currentRoute.value = Get.currentRoute;
    _haveMoreRoutesValidation();
  }

  void back() {
    Get.back();
    _currentRoute.value = Get.currentRoute;
    _haveMoreRoutesValidation();
  }

  void next() {
    final index = _routesHistory.indexWhere(
        (RoutesHistoryModel element) => element.route == _currentRoute.value);

    if (_routesHistory.last.route != Get.currentRoute) {
      Get.toNamed(
        _routesHistory[index + 1].route,
        arguments: _routesHistory[index + 1].arguments,
      );
      _currentRoute.value = Get.currentRoute;
    }
    _haveMoreRoutesValidation();
  }
}
