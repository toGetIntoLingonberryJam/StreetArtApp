import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class DefaultSnackbar extends SnackBar {
  DefaultSnackbar(BuildContext context, {required String message, super.key})
      : super(
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: TextStyles.text.copyWith(color: Theme.of(context).colorScheme.inverseSurface),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(milliseconds: 2500),
          backgroundColor: Theme.of(context).colorScheme.onBackground,
        );
}

class ErrorSnackbar extends SnackBar {
  ErrorSnackbar(BuildContext context, {required String message, super.key})
      : super(
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: TextStyles.text.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(milliseconds: 2500),
          backgroundColor: Theme.of(context).colorScheme.onBackground,
        );
}
