import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';
import 'package:symphony_desktop/ui/widgets/buttons/circle_button_widget.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  final NavigationController navigationController =
      Get.find<NavigationController>();

  final String? title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNextPressed;
  final bool? showBackButton;
  final bool? showNextButton;

  @override
  final Size preferredSize = const Size.fromHeight(60);

  HeaderWidget({
    super.key,
    this.title,
    this.onBackPressed,
    this.onNextPressed,
    this.showBackButton = true,
    this.showNextButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: showBackButton!,
                      child: Obx(
                        () => CircleButton(
                          icon: Ionicons.chevron_back_outline,
                          isEnabled: onBackPressed != null
                              ? navigationController.getHaveBackRoute || true
                              : navigationController.getHaveBackRoute,
                          onPressed: onBackPressed ??
                              () => navigationController.back(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16 / 2),
                    Visibility(
                      visible: showNextButton!,
                      child: Obx(
                        () => CircleButton(
                          icon: Ionicons.chevron_forward_outline,
                          isEnabled: onNextPressed != null
                              ? navigationController.getHaveNextRoute || true
                              : navigationController.getHaveNextRoute,
                          onPressed: onNextPressed ??
                              () => navigationController.next(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title ?? "",
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
