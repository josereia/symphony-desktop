import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/player_controller.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/ui/widgets/lists/horizontal_list_widget.dart';

class SongsList extends HorizontalList {
  final PlayerController _playerController = Get.find<PlayerController>();
  final List<SongModel> data;

  SongsList({super.key, required super.title, required this.data})
      : super(itemCount: data.length > 1 ? 10 : 0);

  @override
  Widget item({required BuildContext context, required int index}) {
    return InkWell(
      onTap: () => _playerController.play(data, index, title),
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              width: 148,
              height: 148,
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                data[index].albumArt,
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 148,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    data[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: _playerController.getCurrentSong.title ==
                                      data[index].title &&
                                  _playerController.getCurrentSong.artists ==
                                      data[index].artists
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).textTheme.titleMedium?.color,
                        ),
                  ),
                ),
                Obx(
                  () => Text(
                    data[index].artists.join(", "),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _playerController.getCurrentSong.title ==
                                  data[index].title &&
                              _playerController.getCurrentSong.artists ==
                                  data[index].artists
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void seeMoreAction() {
    Get.toNamed("/seeMore", arguments: [title, data, item]);
  }
}
