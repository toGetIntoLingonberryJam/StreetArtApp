import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.withToggleEye = false,
  });

  const AppTextFormField.withToggleEye({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.withToggleEye = true,
  });

  final TextEditingController controller;
  final String hintText;
  final ValidateFunction validator;
  final bool withToggleEye;
  final bool enabled;
  final Widget? prefixIcon;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: UIColors.purple,
      obscureText: widget.withToggleEye && !isVisible,
      decoration: InputDecoration(
          helperText: '',
          filled: true,
          fillColor: UIColors.backgroundCard,
          contentPadding: const EdgeInsets.only(right: 16),
          prefix: widget.prefixIcon == null ? const Padding(padding: EdgeInsets.only(left: 16)) : null,
          prefixIcon: widget.prefixIcon,
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
            borderSide: const BorderSide(color: UIColors.purple, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: kFieldBorderRadius,
            borderSide: const BorderSide(
              color: UIColors.error,
              width: 2,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: NewTextStyles.bodyRegular.copyWith(color: UIColors.textPrimary)),
    );
  }
}
