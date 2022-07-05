import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';

class LibraryPage extends GetView {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderWidget(title: "Biblioteca"),
      body: Center(
        child: Text('Biblioteca'),
      ),
    );
  }
}
