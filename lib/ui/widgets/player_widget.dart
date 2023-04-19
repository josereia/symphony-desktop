import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/buttons/button_widget.dart';
import 'package:symphony_desktop/ui/widgets/buttons/icon_button_widget.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/progress_bar_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class PlayerWidget extends StatelessWidget {
  final PlayerService playerService = Get.find<PlayerService>();

  PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: metrics.blurAmmount,
          sigmaY: metrics.blurAmmount,
        ),
        child: Container(
          width: metrics.playerSize.width,
          height: metrics.playerSize.height,
          padding: EdgeInsets.symmetric(horizontal: metrics.padding),
          decoration: BoxDecoration(
            color: colors.sidebar,
            border: Border(
              top: BorderSide(
                width: metrics.borderWidth,
                color: colors.border,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        playerService.getCurrentSong?.title ?? "",
                        isBold: true,
                      ),
                      TextWidget(
                        playerService.getCurrentSong?.artist ?? "",
                      ),
                    ],
                  ),
                ),
              ),
              const GapWidget(
                direction: GapWidgetDirections.horizontal,
                size: GapWidgetSizes.normal,
              ),
              SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButtonWidget(
                          icon: Ionicons.shuffle,
                          onPressed: () => {},
                        ),
                        const GapWidget(
                          direction: GapWidgetDirections.horizontal,
                          size: GapWidgetSizes.normal,
                        ),
                        IconButtonWidget(
                          icon: Ionicons.play_skip_back,
                          onPressed: () => playerService.previous(),
                        ),
                        const GapWidget(
                          direction: GapWidgetDirections.horizontal,
                          size: GapWidgetSizes.small,
                        ),
                        Obx(
                          () => ButtonWidget(
                            icon: playerService.getIsPlaying == true
                                ? Ionicons.pause
                                : Ionicons.play,
                            onPressed: () => playerService.playOrPause(),
                          ),
                        ),
                        const GapWidget(
                          direction: GapWidgetDirections.horizontal,
                          size: GapWidgetSizes.small,
                        ),
                        IconButtonWidget(
                          icon: Ionicons.play_skip_forward,
                          onPressed: () => playerService.next(),
                        ),
                        const GapWidget(
                          direction: GapWidgetDirections.horizontal,
                          size: GapWidgetSizes.normal,
                        ),
                        IconButtonWidget(
                          icon: Ionicons.repeat,
                          onPressed: () => {},
                        ),
                      ],
                    ),
                    const GapWidget(
                      direction: GapWidgetDirections.vertical,
                      size: GapWidgetSizes.small,
                    ),
                    Obx(
                      () => ProgressBarWidget(
                        total: playerService.getDuration,
                        progress: playerService.getPosition,
                        onSeek: (Duration duration) => playerService.seek(
                          duration,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const GapWidget(
                direction: GapWidgetDirections.horizontal,
                size: GapWidgetSizes.normal,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
