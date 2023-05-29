import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/themes/app_theme_extentions.dart';
import 'package:symphony_desktop/ui/widgets/gap_widget.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';
import 'package:symphony_desktop/ui/widgets/screen_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class QueuePage extends StatelessWidget {
  final PlayerService playerService = Get.find<PlayerService>();

  QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return ScreenWidget(
      header: const HeaderWidget(
        title: "Lista de reprodução",
      ),
      body: Obx(
        () => ReorderableListView.builder(
          onReorder: (int oldIndex, int newIndex) => playerService.reorder(
            oldIndex,
            newIndex,
          ),
          buildDefaultDragHandles: false,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
            top: metrics.headerSize.height,
            bottom: metrics.playerSize.height,
          ),
          itemCount: playerService.getQueue?.length ?? 0,
          proxyDecorator: (child, index, animation) => ClipRRect(
            borderRadius: BorderRadius.all(metrics.borderRadius / 2),
            child: child,
          ),
          itemBuilder: (context, index) {
            final song = playerService.getQueue?[index];
            return Container(
              key: Key(index.toString()),
              margin: EdgeInsets.only(bottom: metrics.gap),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () => {},
                  borderRadius: BorderRadius.all(metrics.borderRadius / 2),
                  hoverColor: colors.secondary,
                  child: Ink(
                    width: double.infinity,
                    padding: EdgeInsets.all(metrics.smallPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      metrics.borderRadius / 2),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      song?.thumbnail.toString() ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const GapWidget(
                                direction: GapWidgetDirections.horizontal,
                                size: GapWidgetSizes.small,
                              ),
                              TextWidget(song?.title ?? ""),
                            ],
                          ),
                        ),
                        ReorderableDragStartListener(
                          index: index,
                          child: Icon(
                            Ionicons.reorder_three_outline,
                            color: colors.text,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
