import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/controllers/player_controller.dart';
import 'package:symphony_desktop/ui/widgets/buttons/circle_button_widget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PlayerWidget extends StatelessWidget {
  final PlayerController controller = Get.find<PlayerController>();

  PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16 * 1.6, vertical: 0),
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff2f2e34)
          : const Color(0xFFECECEC),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Row(
              children: [
                Obx(
                  () => Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.getCurrentSong.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          controller.getCurrentSong.artists.join(", "),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Ionicons.heart_outline),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 300,
                maxWidth: 600,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () => controller.setShuffle(),
                          color: controller.getIsShuffle
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).iconTheme.color,
                          icon: const Icon(
                            Ionicons.shuffle_outline,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => controller.previous(),
                        icon: const Icon(Ionicons.play_skip_back_outline),
                      ),
                      const SizedBox(width: 16),
                      Obx(
                        () => CircleButton(
                          color: Theme.of(context).colorScheme.onPrimary,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          onPressed: () => controller.playOrPause(),
                          icon: controller.getIsPlaying
                              ? Ionicons.pause_outline
                              : Ionicons.play_outline,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => controller.next(),
                        icon: const Icon(Ionicons.play_skip_forward_outline),
                      ),
                      const SizedBox(width: 16),
                      Obx(
                        () => IconButton(
                          onPressed: () => controller.setRepeat(),
                          color: controller.getIsLoop
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).iconTheme.color,
                          icon: const Icon(
                            Ionicons.repeat_outline,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => ProgressBar(
                      progress: controller.getPosition,
                      total: controller.getDuration,
                      buffered: controller.getBufferedPosition,
                      thumbRadius: 4,
                      thumbGlowRadius: 6,
                      onSeek: (position) => controller.setSeek(position),
                      timeLabelLocation: TimeLabelLocation.sides,
                      timeLabelTextStyle: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Ionicons.list_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Ionicons.radio_outline),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => IconButton(
                            onPressed: () => controller.muteOrUnmute(),
                            icon: Icon(
                              controller.getVolume == 0
                                  ? Ionicons.volume_mute_outline
                                  : controller.getVolume > 0 &&
                                          controller.getVolume <= 0.2
                                      ? Ionicons.volume_off_outline
                                      : controller.getVolume > 0.2 &&
                                              controller.getVolume <= 0.5
                                          ? Ionicons.volume_low_outline
                                          : controller.getVolume > 0.5 &&
                                                  controller.getVolume <= 0.8
                                              ? Ionicons.volume_medium_outline
                                              : Ionicons.volume_high_outline,
                            ),
                          ),
                        ),
                        Obx(
                          () => SizedBox(
                            width: 120,
                            child: SfSliderTheme(
                              data: SfSliderThemeData(
                                thumbRadius: 4,
                                overlayRadius: 6,
                                activeTrackHeight: 5,
                                inactiveTrackHeight: 5,
                                tooltipBackgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                tooltipTextStyle: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                              child: SfSlider(
                                min: 0.0,
                                max: 1.0,
                                enableTooltip: true,
                                tooltipTextFormatterCallback: (actualValue,
                                        formattedText) =>
                                    (actualValue * 100.0).toStringAsFixed(0) +
                                    "%",
                                value: controller.getVolume,
                                onChanged: (dynamic value) =>
                                    controller.setVolume(value),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
