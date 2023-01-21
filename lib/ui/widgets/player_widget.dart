import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/theme/app_theme_extensions.dart';
import 'package:symphony_desktop/ui/widgets/buttons/circle_button_widget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PlayerWidget extends GetView<PlayerService> {
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 1.6,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colors.background.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Visibility(
                  visible: controller.getCurrentSong != null,
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.getCurrentSong?.title ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: theme.textTheme.titleLarge,
                            ),
                            Text(
                              controller.getCurrentSong?.author ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Ionicons.heart_outline),
                      ),
                    ],
                  ),
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
                              onPressed: () => controller.shuffle(),
                              icon: const Icon(Ionicons.shuffle_outline),
                              color: controller.getIsShuffle == true
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color,
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
                              color: theme.colorScheme.onPrimary,
                              backgroundColor: theme.colorScheme.primary,
                              onPressed: () => controller.playOrPause(),
                              icon: controller.getIsPlaying == true
                                  ? Ionicons.pause_outline
                                  : Ionicons.play_outline,
                            ),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            onPressed: () => controller.next(),
                            icon: const Icon(
                              Ionicons.play_skip_forward_outline,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Obx(
                            () => IconButton(
                              onPressed: () => controller.loop(),
                              icon: const Icon(Ionicons.repeat_outline),
                              color: controller.getIsLoop == true
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color,
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => ProgressBar(
                          onSeek: (position) => controller.seek(position),
                          thumbRadius: 4,
                          thumbGlowRadius: 6,
                          timeLabelLocation: TimeLabelLocation.sides,
                          timeLabelTextStyle: theme.textTheme.bodySmall,
                          progress: controller.getPosition,
                          buffered: controller.getBufferedPosition,
                          total: controller.getCurrentSong?.duration ??
                              const Duration(
                                milliseconds: 0,
                              ),
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
                        Obx(
                          () => Row(
                            children: [
                              IconButton(
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
                                                      controller.getVolume <=
                                                          0.8
                                                  ? Ionicons
                                                      .volume_medium_outline
                                                  : Ionicons
                                                      .volume_high_outline,
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                    thumbRadius: 4,
                                    overlayRadius: 6,
                                    activeTrackHeight: 5,
                                    inactiveTrackHeight: 5,
                                    tooltipBackgroundColor:
                                        theme.colorScheme.primary,
                                    tooltipTextStyle:
                                        theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                  child: SfSlider(
                                    min: 0.0,
                                    max: 1.0,
                                    enableTooltip: true,
                                    tooltipTextFormatterCallback:
                                        (actualValue, formattedText) =>
                                            (actualValue * 100.0)
                                                .toStringAsFixed(0) +
                                            "%",
                                    value: controller.getVolume,
                                    onChanged: (dynamic value) =>
                                        controller.setVolume = value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
