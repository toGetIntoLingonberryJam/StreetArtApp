import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/utils/debugging.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

abstract class ErrorHandler {
  static void unknown() {
    Utils.showSnackBar('Произошла неизвестная ошибка');
  }

  static void message(String message) {
    Utils.showSnackBar(message);
  }

  static void dio(DioException e, {RequestType? requestType}) {
    Debug.log(e);

    try {
      Utils.showSnackBar(
        _requestErrorComments[requestType!]![e.response!.statusCode!]!,
      );
    } on Exception {
      unknown();
    }
  }
}

enum RequestType {
  login,
  register,
  getUserViaToken,
  getArtworkLocations,
  getAuthors,
  getArtworks,
}

const Map<RequestType, Map<int, String>> _requestErrorComments = {
  RequestType.login: {
    400: 'Такого пользователя не существует',
    422: 'Произошла ошибка валидации',
  },
  RequestType.register: {
    400: 'Такой пользователь уже существует (или длина пароля < 3 символов)',
    422: 'Произошла ошибка валидации',
  },
  RequestType.getUserViaToken: {
    401: 'Ошибка авторизации. Пожалуйста, войдите в аккаунт'
  },
  RequestType.getArtworkLocations: {},
  RequestType.getAuthors: {},
  RequestType.getArtworks: {},
};
