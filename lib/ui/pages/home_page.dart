import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/pages/home_page_controller.dart';
import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';
import 'package:symphony_desktop/ui/widgets/lists/songs_list_widget.dart';
import 'package:symphony_desktop/updater.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AutoUpdater(context: context).checkForUpdates();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HeaderWidget(),
      body: Obx(
        () => Visibility(
          visible: controller.getPlaylists != null,
          replacement: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 60,
                left: 16 * 1.6,
                right: 16 * 1.6,
              ),
              child: Column(
                children: [
                  for (PlaylistModel playlist in controller.getPlaylists ?? [])
                    Column(
                      children: [
                        SongsList(
                          title: playlist.title,
                          playlist: playlist,
                        ),
                        const SizedBox(height: 50),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
