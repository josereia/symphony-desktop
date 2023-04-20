import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/routes/app_routes.dart';
import 'package:symphony_desktop/services/navigation_service.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/player_widget.dart';
import 'package:symphony_desktop/ui/widgets/sidebar_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';
import 'package:symphony_desktop/ui/widgets/window_titlebar_widget.dart';

class _SidebarHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        TextWidget(
          "symphony",
          size: TextWidgetSizes.title,
        ),
      ],
    );
  }
}

class _SidebarBodyWidget extends StatelessWidget {
  final NavigationService _navigationService = Get.find<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "text": "Buscar",
        "defaultIcon": Ionicons.search_outline,
        "activeIcon": Ionicons.search,
        "route": AppRoutes.search,
      },
      {
        "text": "Biblioteca",
        "defaultIcon": Ionicons.library_outline,
        "activeIcon": Ionicons.library,
        "route": AppRoutes.library,
      },
    ];

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => const GapWidget(
        direction: GapWidgetDirections.vertical,
        size: GapWidgetSizes.small,
      ),
      itemBuilder: (BuildContext context, int index) => Obx(
        () => SidebarItemWidget(
          text: items[index]["text"],
          defaultIcon: items[index]["defaultIcon"],
          activeIcon: items[index]["activeIcon"],
          isActive: _navigationService.getCurrentRoute == items[index]["route"],
          onPressed: () => _navigationService.toNamed(items[index]["route"]),
        ),
      ),
    );
  }
}

class _SidebarFooterWidget extends StatelessWidget {
  final PlayerService playerService = Get.find<PlayerService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: playerService.getCurrentSong?.thumbnail != null,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.network(
            playerService.getCurrentSong?.thumbnail.toString() ??
                "https://community.mp3tag.de/uploads/default/original/2X/a/acf3edeb055e7b77114f9e393d1edeeda37e50c9.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _WindowContent extends StatelessWidget {
  final Widget child;

  const _WindowContent({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SidebarWidget(
          headerWidget: _SidebarHeaderWidget(),
          bodyWidget: _SidebarBodyWidget(),
          footerWidget: _SidebarFooterWidget(),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: child),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: PlayerWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBuilder extends StatelessWidget {
  final bool isTransparent;
  final Widget? child;

  const AppBuilder({
    super.key,
    required this.isTransparent,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    final Color backgroundColor =
        isTransparent ? Colors.transparent : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: _WindowContent(
              child: Container(
                color: colors.background,
                padding: EdgeInsets.all(metrics.padding),
                child: child,
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: WindowTitlebarWidget(),
          ),
        ],
      ),
    );
  }
}
