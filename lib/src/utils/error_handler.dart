import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

abstract class ErrorHandler {
  static void handleUnknownError() {
    Utils.showSnackBar('Что-то пошло не так. Пожалуйста, попробуйте позже');
  }

  static void handleDioException(DioException e) {
    print(
        'Handling DioException\nmessage: ${e.message}\nerrorData: ${e.response?.data}');

    switch (e.response?.statusCode) {
      case 500:
        // Server unavailable
        Utils.showSnackBar(
            'Не удалось подключиться к серверу. Пожалуйста, попробуйте ещё раз');
        break;
      case 422:
        // Validation error
        Utils.showSnackBar(
            'Не удалось обработать запрос. Пожалуйста, проверьте правильность заполнения всех полей');
      case 400:
        // Bad request
        Utils.showSnackBar(
            'Такого пользователя не существует. Возможно, он был удален. А может, вы пытаетесь зарегистрироваться. Тогда такой пользователь уже есть и вам надо попробовать выполнить вход');
      default:
        Utils.showSnackBar(
            'Произошла неизвестная ошибка. Пожалуйста, попробуйте позже');
    }
  }
}
