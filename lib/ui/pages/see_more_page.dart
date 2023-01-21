// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:symphony_desktop/data/models/playlist_model.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';

class SeeMore extends GetView {
  final args = Get.arguments;
  PlaylistModel? _playlist;
  String? _title;
  dynamic _item;

  SeeMore({super.key}) {
    _title = args[0] as String;
    _playlist = args[1] as PlaylistModel;
    _item = args[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HeaderWidget(
        title: _title,
        onBackPressed: () => Get.back(),
        showNextButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60).copyWith(top: 24),
        child: ResponsiveGridList(
          horizontalGridMargin: 16 * 1.6,
          minItemWidth: 148,
          minItemsPerRow: 6,
          maxItemsPerRow: 10,
          children: List.generate(
            _playlist!.songs.length,
            (index) => _item(context: context, index: index),
          ),
        ),
      ),
    );
  }
}
