import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/validator.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.withToggleEye = false,
  });

  const AppTextFormField.withToggleEye({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.withToggleEye = true,
  });

  final TextEditingController controller;
  final String hintText;
  final ValidateFunction validator;
  final bool withToggleEye;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: Theme.of(context).colorScheme.secondary,
      obscureText: widget.withToggleEye && !isVisible,
      decoration: InputDecoration(
          helperText: '',
          filled: true,
          fillColor: Theme.of(context).colorScheme.onBackground,
          contentPadding: const EdgeInsets.only(right: 16),
          prefix: const Padding(padding: EdgeInsets.only(left: 16)),
          suffixIcon: widget.withToggleEye
              ? IconButton(
                  onPressed: () => setState(() => isVisible = !isVisible),
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ))
              : null,
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
          hintText: widget.hintText,
          hintStyle: TextStyles.input.copyWith(
            color: Theme.of(context).colorScheme.inverseSurface,
          )),
    );
  }
}
