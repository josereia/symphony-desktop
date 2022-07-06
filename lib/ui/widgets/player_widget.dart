import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/player_controller.dart';

class PlayerWidget extends GetView<PlayerController> {
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16 * 1.6, vertical: 0),
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff2f2e34)
          : const Color(0xFFECECEC),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.getCurrentSong.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(controller.getCurrentSong.artists.join(", ")),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {},
                icon: const Icon(FeatherIcons.heart),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FeatherIcons.shuffle),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () => controller.previous(),
                          icon: const Icon(FeatherIcons.skipBack),
                        ),
                        const SizedBox(width: 16),
                        Obx(
                          () => IconButton(
                            onPressed: () => controller.playOrPause(),
                            icon: Icon(controller.getIsPlaying
                                ? FeatherIcons.pause
                                : FeatherIcons.play),
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () => controller.next(),
                          icon: const Icon(FeatherIcons.skipForward),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FeatherIcons.repeat),
                        ),
                      ],
                    ),
                    Obx(
                      () => ProgressBar(
                        progress: controller.getPosition,
                        total: controller.getDuration,
                        buffered: controller.getBufferedPosition,
                        thumbRadius: 6,
                        thumbGlowRadius: 8,
                        onSeek: (position) => controller.seek(position),
                        timeLabelLocation: TimeLabelLocation.sides,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
