import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPage extends GetView {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
      ),
      body: const Center(
        child: Text('Biblioteca'),
      ),
    );
  }
}
