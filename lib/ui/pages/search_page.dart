import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:symphony_desktop/ui/widgets/fields/text_field_widget.dart';
import 'package:symphony_desktop/ui/widgets/text_widget.dart';

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFieldWidget(
          controller: TextEditingController(),
          hintText: "Busque por músicas, álbuns ou artistas.",
          prefixIcon: Ionicons.search,
        ),
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Center(
            child: TextWidget("Buscar"),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _HeaderWidget(),
        ),
      ],
    );
  }
}
