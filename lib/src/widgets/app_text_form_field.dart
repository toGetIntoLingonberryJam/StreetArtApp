import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/validator.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validate,
  });

  final TextEditingController controller;
  final String hintText;
  final Validate validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: Validator.get(validate),
      controller: controller,
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
          helperText: '',
          filled: true,
          fillColor: Theme.of(context).colorScheme.onBackground,
          contentPadding: const EdgeInsets.only(right: 16),
          prefix: const Padding(padding: EdgeInsets.only(left: 16)),
          border: OutlineInputBorder(
            borderRadius: kFieldBorderRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: kFieldBorderRadius,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: kFieldBorderRadius,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          )),
    );
  }
}
