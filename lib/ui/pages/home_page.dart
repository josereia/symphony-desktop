import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/ui/widgets/header_widget.dart';
import 'package:symphony_desktop/ui/widgets/lists/horizontal_list_widget.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(title: "Início"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
              HorizontalList(),
            ],
          ),
        ),
      ),
    );
  }
}
