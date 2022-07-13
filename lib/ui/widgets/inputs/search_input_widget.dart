import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchInput extends StatelessWidget {
  final String hintText;
  final Function onSubmitted;

  const SearchInput({super.key, required this.hintText, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
     
      onSubmitted: (value) => onSubmitted(value),
      decoration: InputDecoration(
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 40,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary.withAlpha(60),
        prefixIcon: const Icon(Ionicons.search),
        hintText: hintText,
      ),
    );
  }
}
