import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/controllers/search_page_controller.dart';
import 'package:symphony_desktop/ui/widgets/fields/text_field_widget.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';
import 'package:symphony_desktop/ui/widgets/loading_widget.dart';
import 'package:symphony_desktop/ui/widgets/screen_widget.dart';
import 'package:symphony_desktop/ui/widgets/songs_grid_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      header: HeaderWidget(
        title: "Buscar",
        child: Center(
          child: TextFieldWidget(
            controller: controller.getSearchFieldController,
            hintText: "Busque por músicas, álbuns ou artistas.",
            prefixIcon: Ionicons.search,
            onSubmitted: (String value) => controller.search(),
          ),
        ),
      ),
      body: Obx(
        () => Visibility(
          visible: controller.getIsSearching == false,
          replacement: const Center(
            child: LoadingWidget(
              isShowText: true,
              text: "Buscando",
            ),
          ),
          child: Visibility(
            visible: controller.getResults != null,
            replacement: const Center(
              child: TextWidget("Nada há mostrar."),
            ),
            child: SongsGridWidget(
              songs: controller.getResults ?? [],
            ),
          ),
        ),
      ),
    );
  }
}
