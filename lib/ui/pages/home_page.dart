import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/database_controller.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';
import 'package:symphony_desktop/ui/widgets/lists/albums_list_widget.dart';
import 'package:symphony_desktop/ui/widgets/lists/artists_list_widget.dart';
import 'package:symphony_desktop/ui/widgets/lists/songs_list_widget.dart';
import 'package:symphony_desktop/updater.dart';

class HomePage extends GetView<DatabaseController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AutoUpdater().checkForUpdates(context);
    return Scaffold(
      appBar: const HeaderWidget(title: "Início"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16 * 1.6, bottom: 100, left: 16 * 1.6, right: 16 * 1.6),
          child: Column(
            children: [
              ArtistsList(
                title: "artists".tr,
              ),
              Obx(
                () => SongsList(
                  title: "recommended".tr,
                  data: controller.getSongsList,
                ),
              ),
              AlbumsList(
                title: "some_albums".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
