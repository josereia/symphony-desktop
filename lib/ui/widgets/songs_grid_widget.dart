import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class _SongWidget extends StatefulWidget {
  final SongModel song;
  final bool isActive;
  final void Function()? onPressed;

  const _SongWidget({
    required this.song,
    required this.isActive,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<_SongWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    late Color backgroundColor;
    late Color foregroundColor;

    if (widget.isActive) {
      backgroundColor = colors.secondary;
      foregroundColor = colors.primary;
    } else {
      backgroundColor = colors.background.withOpacity(0.6);
      foregroundColor = colors.text;
    }

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (value) => setState(() => isHovered = value),
        borderRadius: BorderRadius.all(metrics.borderRadius),
        hoverColor: colors.secondary,
        child: Ink(
          padding: EdgeInsets.all(metrics.smallPadding),
          decoration: BoxDecoration(
            color: backgroundColor,
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
              const GapWidget(
                direction: GapWidgetDirections.vertical,
                size: GapWidgetSizes.small,
              ),
              TextWidget(
                widget.song.title,
                isBold: true,
                isAutoScroll: isHovered,
                color: foregroundColor,
              ),
              TextWidget(
                widget.song.artist,
                isAutoScroll: isHovered,
                color: foregroundColor,
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
        mainAxisExtent: 162,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      children: [
        for (SongModel song in songs)
          Obx(
            () => _SongWidget(
              song: song,
              isActive: playerService.getCurrentSong?.id == song.id,
              onPressed: () => playerService.play(
                songs: songs,
                index: song.index,
              ),
            ),
          ),
      ],
    );
  }
}
