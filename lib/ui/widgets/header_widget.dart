import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';
import 'package:symphony_desktop/ui/widgets/buttons/circle_button_widget.dart';

class HeaderWidget extends GetWidget<NavigationController>
    with PreferredSizeWidget {
  final String? title;

  @override
  final Size preferredSize = const Size.fromHeight(100);

  const HeaderWidget({super.key, this.title});

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
              Row(
                children: [
                  CircleButton(
                    icon: Ionicons.chevron_back_outline,
                    onPressed: () => controller.back(),
                  ),
                  const SizedBox(width: 16 / 2),
                  const CircleButton(
                    icon: Ionicons.chevron_forward_outline,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Text(title ?? "",
                  style: Theme.of(context).textTheme.headlineLarge),
            ],
          )
        ],
      ),
    );
  }
}
