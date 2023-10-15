import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          // filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          fillColor: Theme.of(context).colorScheme.secondary,
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
