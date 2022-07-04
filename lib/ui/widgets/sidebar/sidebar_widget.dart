import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/navigation_controller.dart';

class SidebarWidget extends GetView<NavigationController> {
  final List _items = [
    {
      "title": "symphony",
      "items": [
        {
          "index": 0,
          "icon": FeatherIcons.home,
          "title": 'Início',
        },
        {
          "index": 1,
          "icon": FeatherIcons.search,
          "title": 'Buscar',
        },
        {
          "index": 2,
          "icon": FeatherIcons.bookOpen,
          "title": 'Biblioteca',
        }
      ]
    },
    {
      "title": "Biblioteca",
      "items": [
        {
          "index": 3,
          "icon": FeatherIcons.disc,
          "title": 'Álbuns',
        },
        {
          "index": 4,
          "icon": FeatherIcons.users,
          "title": 'Cantores',
        },
        {
          "index": 5,
          "icon": FeatherIcons.heart,
          "title": 'Favoritos',
        }
      ]
    }
  ];

  SidebarWidget({super.key});

  Widget _sidebarHeader() {
    return Row(
      children: const [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "https://c.tenor.com/ir2nX96xSJUAAAAC/ghosts-my-profile.gif",
          ),
          radius: 24,
        ),
        SizedBox(width: 16),
        Text(
          "João Sereia",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
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
    }) {
      return Obx(
        () => InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => controller.setIndex(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: controller.getIndex == index
                  ? Theme.of(context).colorScheme.background
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: controller.getIndex == index
                      ? Theme.of(context).colorScheme.onBackground
                      : Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: TextStyle(
                    color: controller.getIndex == index
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.onBackground,
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
          ? Theme.of(context).colorScheme.primary.withAlpha(255)
          : Platform.isLinux
              ? Theme.of(context).colorScheme.primary.withAlpha(200)
              : Theme.of(context).colorScheme.primary.withAlpha(0),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _sidebarHeader(),
                    const SizedBox(height: 16),
                    _sidebarBody(),
                  ],
                ),
              ),
            ),
          ),
          const Image(
            width: 240,
            image: NetworkImage(
                "https://tracklist.com.br/wp-content/uploads/2021/04/olivia-debut.jpg"),
          ),
        ],
      ),
    );
  }
}
