import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/database_controller.dart';
import 'package:symphony_desktop/data/providers/database_provider.dart';
import 'package:symphony_desktop/data/repositories/database_repository.dart';

class DatabaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatabaseController>(
        () => DatabaseController(DatabaseRepository(DatabaseProvider())));
  }
}
