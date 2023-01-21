import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/ui/theme/app_theme_extensions.dart';

class ListModel {
  final int index;
  final IconData icon;
  final IconData activeIcon;
  final String title;
  final String route;

  ListModel({
    required this.index,
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.route,
  });
}

class SidebarModel {
  final String title;
  final List<ListModel> items;

  SidebarModel({required this.title, required this.items});
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isLinux == false
        ? WindowTitleBarBox(
            child: MoveWindow(),
          )
        : Container();
  }
}

class _ItemWidget extends GetView<NavigationController> {
  final IconData icon;
  final IconData activeIcon;
  final String text;
  final int index;
  final String route;

  const _ItemWidget({
    required this.icon,
    required this.activeIcon,
    required this.text,
    required this.index,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Obx(
      () => InkWell(
        onTap: () => controller.toNamed(route),
        borderRadius: BorderRadius.circular(16),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: metrics.buttonPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                controller.getCurrentRoute == route ? activeIcon : icon,
                size: 18,
                color: controller.getCurrentRoute == route
                    ? colors.text
                    : colors.text.withOpacity(0.6),
              ),
              const SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  color: controller.getCurrentRoute == route
                      ? colors.text
                      : colors.text.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarWidget extends GetView<NavigationController> {
  final List<SidebarModel> _items = [
    SidebarModel(
      title: "symphony",
      items: [
        ListModel(
          index: 0,
          icon: Ionicons.home_outline,
          activeIcon: Ionicons.home,
          title: "home".tr,
          route: AppRoutes.initial,
        ),
        ListModel(
          index: 1,
          icon: Ionicons.search_outline,
          activeIcon: Ionicons.search,
          title: "search".tr,
          route: AppRoutes.search,
        ),
        ListModel(
          index: 2,
          icon: Ionicons.library_outline,
          activeIcon: Ionicons.library,
          title: "library".tr,
          route: AppRoutes.library,
        ),
      ],
    ),
    SidebarModel(
      title: "library".tr,
      items: [
        ListModel(
          index: 3,
          icon: Ionicons.disc_outline,
          activeIcon: Ionicons.disc,
          title: "albums".tr,
          route: AppRoutes.albums,
        ),
        ListModel(
          index: 4,
          icon: Ionicons.people_circle_outline,
          activeIcon: Ionicons.people_circle,
          title: "artists".tr,
          route: AppRoutes.artists,
        ),
        ListModel(
          index: 2,
          icon: Ionicons.heart_outline,
          activeIcon: Ionicons.heart,
          title: "favorites".tr,
          route: AppRoutes.favorites,
        ),
      ],
    ),
  ];

  SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return SizedBox(
      width: 240,
      child: Column(
        children: [
          _HeaderWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _items.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16 * 2),
                itemBuilder: (context, categoryIndex) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _items[categoryIndex].title,
                      style: TextStyle(
                        color: colors.text.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _items[categoryIndex].items.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, itemIndex) => _ItemWidget(
                        icon: _items[categoryIndex].items[itemIndex].icon,
                        activeIcon:
                            _items[categoryIndex].items[itemIndex].activeIcon,
                        text: _items[categoryIndex].items[itemIndex].title,
                        index: _items[categoryIndex].items[itemIndex].index,
                        route: _items[categoryIndex].items[itemIndex].route,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Visibility(
            visible: true, //playerController.getCurrentSong.albumArt != "",
            child: Image(
              width: 240,
              height: 240,
              fit: BoxFit.cover,
              gaplessPlayback: true,
              image: CachedNetworkImageProvider(
                  "https://upload.wikimedia.org/wikipedia/pt/7/71/Sour_-_Olivia_Rodrigo.png" //playerController.getCurrentSong.albumArt,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
