import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._(this.context);
  final BuildContext context;

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
              label: acceptText,
            ),
            AppButton.secondary(
              onTap: () => Navigator.pop(context, false),
              label: declineText,
            ),
          ],
        ),
      );

  Future<T?> showLoading<T>(Future<T> future) async {
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

    try {
      await future;
      if (dialogContext.mounted) Navigator.of(dialogContext).pop();
      return future;
    } catch (e) {
      // Logger.error(e);
      if (dialogContext.mounted) Navigator.of(dialogContext).pop();
      return null;
    }
  }

  Future<bool> tryLaunchUrl(Uri url) async {
    final response = await showWarning(
      title: 'Переход по ссылке',
      content: 'Вы собираетесь перейти по ссылке:\n$url',
      acceptText: 'Перейти',
      declineText: 'Отмена',
    );

    if (response != null && response == true && context.mounted) {
      final success = await showLoading(launchUrl(url)) ?? false;

      if (!success) {
        showError('Не удалось открыть ссылку $url');
        return false;
      }
    }
    return true;
  }
}
