import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class InfoSnackbar extends GetSnackBar {
  InfoSnackbar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: TextStyles.headline2.copyWith(color: Get.theme.colorScheme.inverseSurface),
          ),
          icon: Icon(
            Icons.info_outline,
            color: Get.theme.colorScheme.inverseSurface,
            size: 24,
          ),
          shouldIconPulse: false,
          margin: const EdgeInsets.all(20),
          borderRadius: 10,
          duration: const Duration(milliseconds: 4000),
          animationDuration: const Duration(milliseconds: 750),
          backgroundColor: Get.theme.colorScheme.onBackground,
          borderColor: Get.theme.colorScheme.inverseSurface,
        );
}

class ErrorSnackbar extends GetSnackBar {
  ErrorSnackbar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: TextStyles.headline2.copyWith(color: Get.theme.colorScheme.error),
          ),
          icon: Icon(
            Icons.error_outline,
            color: Get.theme.colorScheme.error,
            size: 24,
          ),
          shouldIconPulse: false,
          margin: const EdgeInsets.all(20),
          borderRadius: 10,
          duration: const Duration(milliseconds: 4000),
          animationDuration: const Duration(milliseconds: 750),
          backgroundColor: Get.theme.colorScheme.onBackground,
          borderColor: Get.theme.colorScheme.error,
        );
}

class SuccessSnackBar extends GetSnackBar {
  SuccessSnackBar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: TextStyles.headline2.copyWith(color: Get.theme.colorScheme.primary),
          ),
          icon: Icon(
            Icons.check_circle_outline,
            color: Get.theme.colorScheme.primary,
            size: 24,
          ),
          shouldIconPulse: false,
          margin: const EdgeInsets.all(20),
          borderRadius: 10,
          duration: const Duration(milliseconds: 4000),
          animationDuration: const Duration(milliseconds: 750),
          backgroundColor: Get.theme.colorScheme.onBackground,
          borderColor: Get.theme.colorScheme.primary,
        );
}
