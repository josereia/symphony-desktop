import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: 8,
      child: ProgressBar(
        onSeek: onSeek,
        progress: progress ?? Duration.zero,
        total: total ?? Duration.zero,
        buffered: buffered,
        thumbRadius: 5,
        barHeight: 5,
        thumbGlowRadius: 8,
        timeLabelType: TimeLabelType.totalTime,
        timeLabelLocation: TimeLabelLocation.sides,
        timeLabelTextStyle: theme.textTheme.bodySmall,
      ),
    );
  }
}
