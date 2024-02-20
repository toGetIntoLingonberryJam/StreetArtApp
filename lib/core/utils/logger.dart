import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum LogType {
  apiCall,
  apiResult,
  message,
  success,
  warning,
  error,
  exception,
  dioException,
}

abstract class Logger {
  static const Map<LogType, String> _colorCodes = {
    LogType.apiCall: '36',
    LogType.apiResult: '36',
    LogType.message: '37',
    LogType.success: '32',
    LogType.warning: '33',
    LogType.error: '31',
    LogType.exception: '31',
    LogType.dioException: '31',
  };

  static void _log(Object? message, LogType logType) {
    if (kDebugMode) {
      print('\x1B[${_colorCodes[logType]}m[${logType.name.toUpperCase()}] $message\x1B[0m');
    }
  }

  static void apiCall(String url) => _log(url, LogType.apiCall);
  static void apiResult(String url, Object? result) => _log('$url: $result', LogType.apiResult);

  static void message(Object? message) => _log(message, LogType.message);
  static void success(Object? success) => _log(success, LogType.success);
  static void warning(Object? warning) => _log(warning, LogType.warning);

  static void error(Object? e) => _log(e.toString(), LogType.exception);
  static void exception(Exception e, {required String where}) =>
      _log('[$where], ${e.toString()}', LogType.exception);
  static void dioException(DioException e, {required String where}) =>
      _log('[$where] ${e.toString()} ${e.response?.data}', LogType.dioException);
}
