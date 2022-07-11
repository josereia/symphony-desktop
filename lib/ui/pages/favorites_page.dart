import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';

class FavoritesPage extends GetView {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderWidget(),
      body: Center(
        child: Text('Favoritos'),
      ),
    );
  }
}
