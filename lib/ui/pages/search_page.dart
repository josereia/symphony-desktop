import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:symphony_desktop/controllers/search_page_controller.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/ui/widgets/fields/text_field_widget.dart';
import 'package:symphony_desktop/ui/widgets/loading_widget.dart';
import 'package:symphony_desktop/ui/widgets/songs_grid_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class _HeaderWidget extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFieldWidget(
          controller: controller.getSearchFieldController,
          hintText: "Busque por músicas, álbuns ou artistas.",
          prefixIcon: Ionicons.search,
          onSubmitted: (String value) => controller.search(),
        ),
      ],
    );
  }
}

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Obx(
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
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _HeaderWidget(),
        ),
      ],
    );
  }
}
