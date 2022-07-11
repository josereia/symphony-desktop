// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';

class SeeMore extends GetView {
  final args = Get.arguments;
  List<SongModel>? _data;
  String? _title;
  dynamic _item;

  SeeMore({super.key}) {
    _title = args[0] as String;
    _data = args[1] as List<SongModel>;
    _item = args[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: _title,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16 * 1.6, bottom: 100),
        child: ResponsiveGridList(
          horizontalGridMargin: 16 * 1.6,
          minItemWidth: 148,
          minItemsPerRow: 6,
          maxItemsPerRow: 10,
          children: List.generate(
            _data!.length,
            (index) => _item(context: context, index: index),
          ),
        ),
      ),
    );
  }
}
