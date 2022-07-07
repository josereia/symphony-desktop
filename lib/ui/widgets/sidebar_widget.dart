import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';
import 'package:symphony_desktop/controllers/player_controller.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/main.dart';

class SidebarWidget extends GetView<NavigationController> {
  final PlayerController playerController = Get.find<PlayerController>();
  final List _items = [
    {
      "title": "symphony",
      "items": [
        {
          "index": 0,
          "icon": FeatherIcons.home,
          "title": "home".tr,
          "route": AppRoutes.initial,
        },
        {
          "index": 1,
          "icon": FeatherIcons.search,
          "title": "search".tr,
          "route": AppRoutes.search,
        },
        {
          "index": 2,
          "icon": FeatherIcons.bookOpen,
          "title": "library".tr,
          "route": AppRoutes.library,
        }
      ]
    },
    {
      "title": "library".tr,
      "items": [
        {
          "index": 3,
          "icon": FeatherIcons.disc,
          "title": "albums".tr,
          "route": AppRoutes.albums,
        },
        {
          "index": 4,
          "icon": FeatherIcons.users,
          "title": "artists".tr,
          "route": AppRoutes.artists,
        },
        {
          "index": 5,
          "icon": FeatherIcons.heart,
          "title": "favorites".tr,
          "route": AppRoutes.favorites,
        }
      ]
    }
  ];

  SidebarWidget({super.key});

  Widget _sidebarHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://c.tenor.com/ir2nX96xSJUAAAAC/ghosts-my-profile.gif",
          ),
          radius: 24,
        ),
        const SizedBox(width: 16),
        Text(
          "João Sereia",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget _sidebarBody() {
    Widget categoryItem({
      required BuildContext context,
      required IconData icon,
      required String text,
      required int index,
      required String route,
    }) {
      return Obx(
        () => InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Get.toNamed(route);
            navigationKey.currentState?.popUntil((route) {
              controller.setCurrentRoute(route.settings.name);
              return true;
            });
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16 / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: controller.getCurrentRoute == route
                      ? Colors.black.withAlpha(16)
                      : Colors.transparent,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              color: controller.getCurrentRoute == route
                  ? Theme.of(context).colorScheme.background
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16 * 2),
      itemBuilder: (context, categoryIndex) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(_items[categoryIndex]["title"]),
          const SizedBox(height: 6),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _items[categoryIndex]["items"].length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, categoryItemIndex) => categoryItem(
              context: context,
              icon: _items[categoryIndex]["items"][categoryItemIndex]["icon"],
              text: _items[categoryIndex]["items"][categoryItemIndex]["title"],
              index: _items[categoryIndex]["items"][categoryItemIndex]["index"],
              route: _items[categoryIndex]["items"][categoryItemIndex]["route"],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: kIsWeb
          ? Theme.of(context).colorScheme.primary.withAlpha(40)
          : Platform.isLinux
              ? Theme.of(context).colorScheme.primary.withAlpha(200)
              : Theme.of(context).colorScheme.primary.withAlpha(0),
      child: Column(
        children: [
          WindowTitleBarBox(
            child: Expanded(
              flex: 1,
              child: MoveWindow(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _sidebarHeader(context),
                    const SizedBox(height: 16),
                    _sidebarBody(),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Image(
              width: 240,
              height: 240,
              fit: BoxFit.cover,
              image: NetworkImage(playerController.getCurrentSong.albumArt),
            ),
          ),
        ],
      ),
    );
  }
}
