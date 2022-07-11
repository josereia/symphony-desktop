import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final int itemCount;
  final double? height;
  final ScrollController _scrollController = ScrollController();

  HorizontalList({
    super.key,
    required this.title,
    required this.itemCount,
    this.height,
  });

  Widget item({required BuildContext context, required int index}) {
    return Container();
  }

  void seeMoreAction() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () => seeMoreAction(),
              child: Text("view_more".tr),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: height ?? 216,
          child: Scrollbar(
            controller: _scrollController,
            interactive: true,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 16),
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
              itemBuilder: (BuildContext context, int index) {
                return item(
                  context: context,
                  index: index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
