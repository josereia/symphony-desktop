import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
      ),
      body: const Center(
        child: Text('Buscar'),
      ),
    );
  }
}
