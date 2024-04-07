import 'package:get/get.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/widgets/snackbars.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void _showSnackbar(GetSnackBar snackbar) => Get
    ..closeCurrentSnackbar()
    ..closeAllSnackbars()
    ..showSnackbar(snackbar);

  static void showInfo(Object message) => _showSnackbar(InfoSnackbar('$message'));
  static void showError(Object message) => _showSnackbar(ErrorSnackbar('$message'));
  static void showSuccess(Object message) => _showSnackbar(SuccessSnackBar('$message'));

  static Future<bool?> showDialog({
    required String title,
    String? content,
    bool barrierDismissible = true,
    String acceptText = 'Да',
    String declineText = 'Нет',
  }) async =>
      Get.dialog(
        AlertDialog(
          backgroundColor: Get.theme.colorScheme.background,
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: SATextStyles.title2,
            textAlign: TextAlign.center,
          ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: SATextStyles.text,
                  textAlign: TextAlign.center,
                ),
          actions: [
            SAPrimaryButton(onTap: () => Get.back(result: true), label: acceptText),
            const SizedBox(height: Paddings.normal),
            SASecondaryButton(onTap: () => Get.back(result: false), label: declineText),
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
      loadingWidget: const Center(child: SALoadingIndicator()),
    );
    return result;
  }

  static Future<bool> tryLaunchUrl(Uri url) async {
    final response = await showDialog(
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
