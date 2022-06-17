import 'package:get/get.dart';

class RootController extends GetxController {
  final RxInt _index = 0.obs;

  get getIndex => _index.value;

  void setIndex(int value) {
    _index.value = value;
  }
}
