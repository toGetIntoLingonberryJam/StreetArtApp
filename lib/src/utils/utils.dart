import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';
import 'package:street_art_witnesses/widgets/snackbars/default_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._(this.context);
  final BuildContext context;

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showDebugMessage(String text) => messengerKey.currentState
    ?..clearSnackBars()
    ..showSnackBar(SnackBar(content: Text(text)));

  static Utils of(BuildContext context) => Utils._(context);

  void _showSnackbar(SnackBar snackBar) => ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(snackBar);

  void showMessage(String message) => _showSnackbar(DefaultSnackbar(context, message: message));

  void showError(String message) => _showSnackbar(ErrorSnackbar(context, message: message));

  Future<bool?> showWarning({
    required String title,
    String? content,
    bool barrierDismissible = true,
    String acceptText = 'Да',
    String declineText = 'Нет',
  }) async =>
      showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) => AlertDialog(
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

  Future<T> showLoading<T>(Future<T> future) async {
    // Dismissing keyboard if opened
    FocusManager.instance.primaryFocus?.unfocus();
    BuildContext dialogContext = context;

    showDialog(
      context: dialogContext,
      barrierDismissible: false,
      builder: (context) {
        dialogContext = context;
        return const PopScope(
          canPop: false,
          child: Center(child: AppLoadingIndicator()),
        );
      },
    );

    await future;
    if (dialogContext.mounted) Navigator.of(dialogContext).pop();
    return future;
  }

  Future<bool> tryLaunchUrl(Uri url) async {
    final response = await showWarning(
      title: 'Переход по ссылке',
      content: 'Вы собираетесь перейти на сайт: $url',
      acceptText: 'Перейти',
      declineText: 'Отмена',
    );

    if (response != null && response == true && context.mounted) {
      final success = await showLoading(launchUrl(url));

      if (!success) {
        showError('Could not launch $url');
        return false;
      }
    }
    return true;
  }
}
