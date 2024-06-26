import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void _showSnackbar(GetSnackBar snackbar) => Get
    ..closeCurrentSnackbar()
    ..closeAllSnackbars()
    ..showSnackbar(snackbar);

  static void showInfo(String message) => _showSnackbar(InfoSnackbar(message));
  static void showError(String message) => _showSnackbar(ErrorSnackbar(message));
  static void showSuccess(String message) => _showSnackbar(SuccessSnackBar(message));

  static Future<bool?> showDialog({
    required String title,
    required VoidCallback onAccept,
    VoidCallback? onDecline,
    String? content,
    bool barrierDismissible = true,
    String acceptText = 'Да',
    String declineText = 'Нет',
  }) async =>
      Get.dialog(
        AlertDialog(
          // ignore: deprecated_member_use
          backgroundColor: Get.theme.colorScheme.background,
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: NewTextStyles.title2Regular,
            textAlign: TextAlign.center,
          ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: NewTextStyles.bodyRegular,
                  textAlign: TextAlign.center,
                ),
          actions: [
            AppButton.primary(
              onTap: () {
                onAccept();
                Get.back();
              },
              label: acceptText,
            ),
            const SizedBox(height: Paddings.normal),
            AppButton.secondary(
              onTap: () {
                onDecline?.call();
                Get.back();
              },
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

  static Future<void> tryLaunchUrl(Uri url) async {
    await showDialog(
      title: 'Переход по ссылке',
      content: 'Вы собираетесь перейти по ссылке:\n$url',
      acceptText: 'Перейти',
      declineText: 'Отмена',
      onAccept: () async {
        final success = await showLoading(launchUrl(url)) ?? false;
        if (!success) {
          showError('Не удалось открыть ссылку $url');
        }
      },
    );
  }
}

Future<T?> handleRequest<T>(
  Future<Response> request, {
  void Function(DioException e)? onDioError,
  T Function(Response r)? onResult,
}) async {
  assert(T == Response || onResult != null, 'You should either explicitly set <Response> as T or provide an onResult method');

  try {
    final result = await request;
    return onResult != null ? onResult(result) : result as T?;
  } on DioException catch (e) {
    // Logger.dioException(e);
    onDioError?.call(e);
    return null;
  } catch (e) {
    Logger.w('handleRequest method error fallback');
    if (e is Exception) Logger.exception(e, where: 'handleRequest');
    if (e is Error) Logger.error(e);
    return null;
  }
}
