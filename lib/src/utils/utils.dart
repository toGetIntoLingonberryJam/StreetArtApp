import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/widgets/buttons/app_button.dart';

abstract class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );

    messengerKey.currentState
      ?..clearSnackBars()
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
          title: Text(title, textAlign: TextAlign.center),
          content: content == null
              ? null
              : Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
          actions: [
            AppButton.primary(
              onTap: () => Navigator.pop(context, true),
              child: Text(acceptText),
            ),
            AppButton.secondary(
              onTap: () => Navigator.pop(context, false),
              child: Text(declineText),
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
