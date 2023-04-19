import 'package:flutter/material.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String? text;
  final bool? isShowText;

  const LoadingWidget({super.key, this.text, this.isShowText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        Visibility(
          visible: isShowText == true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const GapWidget(
                direction: GapWidgetDirections.vertical,
                size: GapWidgetSizes.small,
              ),
              TextWidget(text ?? "Carregando"),
            ],
          ),
        ),
      ],
    );
  }
}
