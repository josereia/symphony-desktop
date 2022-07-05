import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';

class SearchPage extends GetView {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderWidget(title: "Buscar"),
      body: Center(
        child: Text('Buscar'),
      ),
    );
  }
}
