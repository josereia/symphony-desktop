import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: const Center(
        child: Text('Favoritos'),
      ),
    );
  }
}
