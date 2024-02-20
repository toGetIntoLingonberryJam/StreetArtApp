import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/core/values/theme.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static ColorScheme get themeColors =>
      Get.isDarkMode ? darkTheme.colorScheme : lightTheme.colorScheme;

  static void _showSnackbar(GetSnackBar snackbar) => Get
    ..closeAllSnackbars()
    ..showSnackbar(snackbar);

  static void showMessage(String message) => _showSnackbar(DefaultSnackbar(message));

  static void showError(String message) => _showSnackbar(ErrorSnackbar(message));

  static Future<bool?> showWarning({
    required String title,
    String? content,
    bool barrierDismissible = true,
    String acceptText = 'Да',
    String declineText = 'Нет',
  }) async =>
      Get.dialog(
        AlertDialog(
          backgroundColor: Utils.themeColors.background,
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
              onTap: () => Get.back(result: true),
              label: acceptText,
            ),
            AppButton.secondary(
              onTap: () => Get.back(result: false),
              label: declineText,
            ),
          ],
        ),
        barrierDismissible: barrierDismissible,
      );

  static Future<T?> showLoading<T>(Future<T> future) async {
    // Dismissing keyboard if opened
    FocusManager.instance.primaryFocus?.unfocus();

    final result = await Get.showOverlay(
      asyncFunction: () async {
        try {
          return await future;
        } catch (e) {
          return null;
        }
      },
      loadingWidget: const Center(child: AppLoadingIndicator()),
    );
    return result;
  }

  static Future<bool> tryLaunchUrl(Uri url) async {
    final response = await showWarning(
      title: 'Переход по ссылке',
      content: 'Вы собираетесь перейти по ссылке:\n$url',
      acceptText: 'Перейти',
      declineText: 'Отмена',
    );

    if (response == true) {
      final success = await showLoading(launchUrl(url)) ?? false;

      if (!success) {
        showError('Не удалось открыть ссылку $url');
        return false;
      }
    }
    return true;
  }
}
