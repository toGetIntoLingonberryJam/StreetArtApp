import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';

abstract class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showDebugMessage(String message) {
    if (!kDebugMode) {
      return;
    }

    final snackBar = SnackBar(
      content: Text(message, style: TextStyles.text),
    );

    messengerKey.currentState
      ?..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  static void showMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message,
          style: TextStyles.text.copyWith(
            color: Theme.of(context).colorScheme.inverseSurface,
          )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(milliseconds: 2500),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
    );

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  static Future<bool?> showWarning(
    BuildContext context, {
    required String title,
    String? content,
    bool barrierDismissible = true,
    String acceptText = 'Да',
    String declineText = 'Нет',
  }) async =>
      showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyles.title2,
            textAlign: TextAlign.center,
          ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: TextStyles.text,
                  textAlign: TextAlign.center,
                ),
          actions: [
            AppButton.primary(
              onTap: () => Navigator.pop(context, true),
              text: acceptText,
            ),
            AppButton.secondary(
              onTap: () => Navigator.pop(context, false),
              text: declineText,
            ),
          ],
        ),
      );

  static Future<T> showLoading<T>(
    BuildContext dialogContext,
    Future<T> future,
  ) async {
    // Dismissing keyboard if opened
    FocusManager.instance.primaryFocus?.unfocus();
    print('Loading...');

    showDialog(
      context: dialogContext,
      barrierDismissible: false,
      builder: (context) {
        dialogContext = context;
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

    await future;
    if (dialogContext.mounted) Navigator.of(dialogContext).pop();
    return future;
  }
}
