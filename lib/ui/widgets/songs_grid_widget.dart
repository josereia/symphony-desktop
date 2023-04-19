import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class _SongWidget extends StatefulWidget {
  final SongModel song;
  final void Function()? onPressed;

  const _SongWidget({
    required this.song,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<_SongWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (value) => setState(() => isHovered = value),
        borderRadius: BorderRadius.all(metrics.borderRadius),
        child: Ink(
          padding: EdgeInsets.all(metrics.smallPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(metrics.borderRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(metrics.borderRadius),
                child: Image.network(
                  widget.song.thumbnail.toString(),
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              TextWidget(
                widget.song.title,
                isBold: true,
                isAutoScroll: isHovered,
              ),
              TextWidget(
                widget.song.artist,
                isAutoScroll: isHovered,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SongsGridWidget extends StatelessWidget {
  final PlayerService playerService = Get.find<PlayerService>();

  final List<SongModel> songs;

  SongsGridWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return GridView(
      padding: EdgeInsets.only(
        top: metrics.padding * 4,
        bottom: metrics.playerSize.height,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 160,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      children: [
        for (SongModel song in songs)
          _SongWidget(
            song: song,
            onPressed: () => playerService.play(
              songs: songs,
              index: song.index,
            ),
          ),
      ],
    );
  }
}
