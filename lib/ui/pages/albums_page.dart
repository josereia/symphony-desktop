import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumsPage extends GetView {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álbuns'),
      ),
      body: const Center(
        child: Text('Álbuns'),
      ),
    );
  }
}
