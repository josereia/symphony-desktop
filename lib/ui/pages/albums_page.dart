import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';

class AlbumsPage extends GetView {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderWidget(),
      body: Center(
        child: Text('Álbuns'),
      ),
    );
  }
}
