import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/buttons/button_widget.dart';
import 'package:symphony_desktop/ui/widgets/buttons/icon_button_widget.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/progress_bar_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key});

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
              SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextWidget("Nome da música", isBold: true),
                    TextWidget("Nome do artista"),
                  ],
                ),
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
                        ButtonWidget(
                          icon: Ionicons.play,
                          onPressed: () => {},
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
                    const ProgressBarWidget(),
                  ],
                ),
              ),
              Container(width: 200),
            ],
          ),
        ),
      ),
    );
  }
}
