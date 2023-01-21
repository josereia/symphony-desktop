import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/pages/home_page_controller.dart';
import 'package:symphony_desktop/data/providers/song_provider.dart';
import 'package:symphony_desktop/data/repositories/home_page_repository.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(
        repository: HomePageRepository(
          songProvider: SongProvider(),
        ),
      ),
    );
  }
}
