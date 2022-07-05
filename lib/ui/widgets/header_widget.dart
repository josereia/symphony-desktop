import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/ui/widgets/buttons/circle_button_widget.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize = const Size.fromHeight(100);

  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleButton(
                icon: FeatherIcons.chevronLeft,
                onPressed: () => Get.back(),
              ),
              const SizedBox(width: 16 / 2),
              const CircleButton(
                icon: FeatherIcons.chevronRight,
              ),
            ],
          )
        ],
      ),
    );
  }
}
