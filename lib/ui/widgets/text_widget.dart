import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

enum TextWidgetSizes {
  title,
  subtitle,
  normal,
}

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextWidgetSizes? size;
  final Color? color;
  final bool? isBold;
  final bool? isAutoScroll;

  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.size,
    this.color,
    this.isBold,
    this.isAutoScroll,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle? defaultStyle = TextStyle(
      color: color,
      fontWeight: isBold == true ? FontWeight.bold : null,
    );

    switch (size) {
      case TextWidgetSizes.normal:
        defaultStyle = theme.textTheme.bodyMedium?.copyWith(
          color: color,
          fontWeight: isBold == true ? FontWeight.bold : null,
        );
        break;
      case TextWidgetSizes.title:
        defaultStyle = theme.textTheme.titleMedium?.copyWith(
          color: color,
          fontWeight: isBold == true ? FontWeight.bold : null,
        );
        break;
      case TextWidgetSizes.subtitle:
        defaultStyle = theme.textTheme.titleSmall?.copyWith(
          color: color,
          fontWeight: isBold == true ? FontWeight.bold : null,
        );
        break;
      default:
        defaultStyle = theme.textTheme.bodyMedium?.copyWith(
          color: color,
          fontWeight: isBold == true ? FontWeight.bold : null,
        );
    }

    return Visibility(
      visible: isAutoScroll == true,
      replacement: Text(
        text,
        style: style ?? defaultStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      child: TextScroll(
        text,
        style: style ?? defaultStyle,
      ),
    );
  }
}
