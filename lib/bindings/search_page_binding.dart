import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/search_page_controller.dart';
import 'package:symphony_desktop/data/providers/youtube_provider.dart';
import 'package:symphony_desktop/data/repositories/search_page_repository.dart';

class SearchPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SearchPageController(
        repository: SearchPageRepository(
          songProvider: YoutubeProvider(),
        ),
      ),
    );
  }
}
