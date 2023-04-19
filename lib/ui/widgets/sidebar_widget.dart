import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class SidebarItemWidget extends StatefulWidget {
  final String text;
  final IconData defaultIcon;
  final IconData activeIcon;
  final bool isActive;
  final void Function()? onPressed;

  const SidebarItemWidget({
    super.key,
    required this.text,
    required this.defaultIcon,
    required this.activeIcon,
    required this.isActive,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _SidebarItemWidgetState();
}

class _SidebarItemWidgetState extends State<SidebarItemWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    late Color backgroundColor;
    late Color foregroundColor;
    late Color shadowColor;
    late IconData icon;

    if (widget.isActive || isHovered) {
      backgroundColor = colors.onSidebar.withOpacity(0.2);
      foregroundColor = colors.onSidebar;
      shadowColor = Colors.transparent;
      icon = widget.activeIcon;
    } else {
      backgroundColor = Colors.transparent;
      foregroundColor = colors.onSidebar;
      shadowColor = Colors.transparent;
      icon = widget.defaultIcon;
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, metrics.smallGap),
            blurRadius: 16,
            color: shadowColor,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.onPressed,
          onHover: (value) => setState(() => isHovered = value),
          borderRadius: BorderRadius.all(metrics.buttonRadius),
          child: Ink(
            height: metrics.buttonSize.height,
            padding: EdgeInsets.symmetric(horizontal: metrics.padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(metrics.buttonRadius),
            ),
            child: Row(
              children: [
                Icon(icon, color: foregroundColor),
                const GapWidget(
                  direction: GapWidgetDirections.horizontal,
                  size: GapWidgetSizes.small,
                ),
                TextWidget(
                  widget.text,
                  color: foregroundColor,
                  isBold: widget.isActive,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarWidget extends StatelessWidget {
  final Widget? headerWidget;
  final Widget? bodyWidget;
  final Widget? footerWidget;

  const SidebarWidget({
    super.key,
    this.headerWidget,
    this.bodyWidget,
    this.footerWidget,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Container(
      width: metrics.sidebarSize.width,
      height: metrics.sidebarSize.height,
      decoration: BoxDecoration(
        color: colors.sidebar,
        border: Border(
          right: BorderSide(
            width: metrics.borderWidth,
            color: colors.border,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: metrics.smallPadding,
              vertical: metrics.padding,
            ),
            child: headerWidget,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: metrics.smallPadding,
                vertical: metrics.padding,
              ),
              child: bodyWidget,
            ),
          ),
          Container(child: footerWidget),
        ],
      ),
    );
  }
}
