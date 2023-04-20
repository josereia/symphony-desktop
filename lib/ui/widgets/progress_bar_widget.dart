import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';

class ProgressBarWidget extends StatefulWidget {
  final double? width;
  final Duration? progress;
  final Duration? total;
  final Duration? buffered;
  final void Function(Duration)? onSeek;

  const ProgressBarWidget({
    super.key,
    this.width,
    this.progress,
    this.total,
    this.buffered,
    this.onSeek,
  });

  @override
  State<StatefulWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;

    return SizedBox(
      width: widget.width,
      height: 8,
      child: ProgressBar(
        onSeek: widget.onSeek,
        progress: widget.progress ?? Duration.zero,
        total: widget.total ?? Duration.zero,
        buffered: widget.buffered,
        thumbRadius: 0,
        barHeight: 5,
        thumbGlowRadius: 8,
        timeLabelType: TimeLabelType.totalTime,
        timeLabelLocation: TimeLabelLocation.sides,
        timeLabelTextStyle: theme.textTheme.bodySmall,
        baseBarColor: colors.primary.withOpacity(0.4),
      ),
    );
  }
}
