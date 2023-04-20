import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/buttons/icon_button_widget.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';

class SliderWidget extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final void Function(double)? onChanged;
  final IconData? icon;
  final void Function()? onIconPressed;

  const SliderWidget({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
    this.icon,
    this.onIconPressed,
  });

  @override
  State<StatefulWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentValue = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() => currentValue = widget.max);
  }

  void onChanged(double value) {
    setState(() => currentValue = value);
    if (widget.onChanged != null) widget.onChanged!(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return SizedBox(
      width: 140,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned.fill(
            left: metrics.smallGap,
            right: -metrics.padding,
            child: Material(
              type: MaterialType.transparency,
              child: SliderTheme(
                data: SliderThemeData(
                  inactiveTrackColor: colors.primary.withOpacity(0.4),
                  overlayColor: Colors.transparent,
                  trackHeight: 2.5,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 2,
                    elevation: 0,
                    pressedElevation: 0,
                  ),
                ),
                child: Slider(
                  min: widget.min,
                  max: widget.max,
                  value: currentValue,
                  label: "${currentValue * 100}",
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Visibility(
              visible: widget.icon != null,
              child: IconButtonWidget(
                icon: widget.icon ?? Ionicons.close,
                onPressed: widget.onIconPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
