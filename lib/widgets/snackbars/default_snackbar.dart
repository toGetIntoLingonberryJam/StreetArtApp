import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class DefaultSnackbar extends GetSnackBar {
  DefaultSnackbar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: TextStyles.text.copyWith(color: Utils.themeColors.inverseSurface),
          ),
          borderRadius: 10,
          duration: const Duration(milliseconds: 2500),
          backgroundColor: Utils.themeColors.onBackground,
        );
}

class ErrorSnackbar extends GetSnackBar {
  ErrorSnackbar(String message, {super.key})
      : super(
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.all(20),
          messageText: Text(
            message,
            style: TextStyles.text.copyWith(color: Utils.themeColors.inverseSurface),
          ),
          borderRadius: 10,
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Utils.themeColors.onBackground,
          borderColor: Colors.white,
        );
}
