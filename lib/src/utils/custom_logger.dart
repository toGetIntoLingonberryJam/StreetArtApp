import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

enum LogType {
  apiCall,
  apiResult,
  message,
  success,
  warning,
  exception,
  dioException,
}

abstract class CustomLogger {
  static const Map<LogType, String> _colorCodes = {
    LogType.apiCall: '36',
    LogType.apiResult: '36',
    LogType.message: '37',
    LogType.success: '32',
    LogType.warning: '33',
    LogType.exception: '31',
    LogType.dioException: '31',
  };

  static void _log(String message, LogType logType) {
    if (kDebugMode) {
      print(
          '\x1B[${_colorCodes[logType]}m[${logType.name.toUpperCase()}] $message\x1B[0m');
    }
  }

  static void showApiCall(String url) => _log(url, LogType.apiCall);

  static void showApiResult(String url, String result) =>
      _log('$url: $result', LogType.apiResult);

  static void showMessage(String message) => _log(message, LogType.message);

  static void showSuccess(String success) => _log(success, LogType.success);

  static void showWarning(String warning) => _log(warning, LogType.warning);

  static void showException(Exception e) =>
      _log(e.toString(), LogType.exception);

  static void showDioException(DioException e, RequestType req) {
    _log('RequestType.${req.name}: ${e.toString()}', LogType.dioException);
    try {
      Utils.showSnackBar(
        _requestErrorComments[req]![e.response!.statusCode!]!,
      );
    } on Exception catch (e) {
      CustomLogger.showException(e);
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
