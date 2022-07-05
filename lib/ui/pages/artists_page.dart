import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistsPage  extends GetView {
  const ArtistsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artistas'),
      ),
      body: const Center(
        child: Text('Artistas'),
      ),
    );
  }
}
