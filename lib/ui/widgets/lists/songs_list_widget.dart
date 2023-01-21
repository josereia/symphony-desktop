import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/widgets/lists/horizontal_list_widget.dart';

class SongsList extends HorizontalList {
  final PlayerService _playerService = Get.find<PlayerService>();

  final PlaylistModel playlist;

  SongsList({super.key, required super.title, required this.playlist})
      : super(
          itemCount: playlist.songs.length,
        );

  @override
  Widget item({required BuildContext context, required int index}) {
    return InkWell(
      onTap: () => _playerService.play(
        playlist: playlist,
        index: index,
      ),
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                cacheKey: playlist.songs[index].id,
                imageUrl: playlist.songs[index].thumbnail.toString(),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 148,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist.songs[index].title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  playlist.songs[index].author,
                  overflow: TextOverflow.ellipsis,
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
    Get.toNamed("/seeMore", arguments: [title, playlist, item]);
  }
}
