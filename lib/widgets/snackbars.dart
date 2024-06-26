import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class InfoSnackbar extends GetSnackBar {
  InfoSnackbar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: NewTextStyles.bodyRegular.copyWith(color: Get.theme.colorScheme.inverseSurface),
          ),
          icon: Icon(
            Icons.done_all,
            color: Get.theme.colorScheme.inverseSurface,
            size: 24,
          ),
          shouldIconPulse: false,
          margin: const EdgeInsets.all(Paddings.normal),
          borderRadius: 12,
          duration: const Duration(milliseconds: 2500),
          animationDuration: const Duration(milliseconds: 750),
          backgroundColor: Get.theme.colorScheme.onBackground,
          boxShadows: [
            const BoxShadow(
              color: Color.fromRGBO(0, 32, 51, 0.12),
              offset: Offset(0, 8),
              blurRadius: 24,
            ),
            const BoxShadow(
              color: Color.fromRGBO(0, 32, 51, 0.04),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        );
}

class ErrorSnackbar extends GetSnackBar {
  ErrorSnackbar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: NewTextStyles.bodyRegular.copyWith(color: Get.theme.colorScheme.inverseSurface),
          ),
          icon: Icon(
            Icons.done_all,
            color: Get.theme.colorScheme.inverseSurface,
            size: 24,
          ),
          shouldIconPulse: false,
          margin: const EdgeInsets.all(Paddings.normal),
          borderRadius: 12,
          duration: const Duration(milliseconds: 2500),
          animationDuration: const Duration(milliseconds: 750),
          backgroundColor: const Color.fromRGBO(217, 45, 32, 1),
          boxShadows: [
            const BoxShadow(
              color: Color.fromRGBO(0, 32, 51, 0.12),
              offset: Offset(0, 8),
              blurRadius: 24,
            ),
            const BoxShadow(
              color: Color.fromRGBO(0, 32, 51, 0.04),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        );
}

class SuccessSnackBar extends GetSnackBar {
  SuccessSnackBar(String message, {super.key})
      : super(
          messageText: Text(
            message,
            style: NewTextStyles.bodyRegular.copyWith(color: Get.theme.colorScheme.inverseSurface),
          ),
          icon: Icon(
            Icons.done_all,
            color: Get.theme.colorScheme.inverseSurface,
            size: 24,
          ),
          shouldIconPulse: false,
          margin: const EdgeInsets.all(Paddings.normal),
          borderRadius: 12,
          duration: const Duration(milliseconds: 2500),
          animationDuration: const Duration(milliseconds: 750),
          backgroundColor: const Color.fromRGBO(5, 179, 101, 1),
          boxShadows: [
            const BoxShadow(
              color: Color.fromRGBO(0, 32, 51, 0.12),
              offset: Offset(0, 8),
              blurRadius: 24,
            ),
            const BoxShadow(
              color: Color.fromRGBO(0, 32, 51, 0.04),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        );
}
