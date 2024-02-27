import 'dart:convert';

import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Log {
  final LogType logType;
  final String message;

  Log({required this.logType, required this.message});

  Log.apiCall(this.message) : logType = LogType.apiCall;
  Log.apiResult(this.message) : logType = LogType.apiResult;
  Log.message(this.message) : logType = LogType.message;
  Log.success(this.message) : logType = LogType.success;
  Log.warning(this.message) : logType = LogType.warning;
  Log.error(this.message) : logType = LogType.error;
  Log.exception(this.message) : logType = LogType.exception;
  Log.dioException(this.message) : logType = LogType.dioException;

  String get output {
    final pen = _mapLogTypeToPen[logType];
    return pen?.call(message) ?? message;
  }

  String get debugName => logType.name.toUpperCase();
}

// TODO: Refactor later
Map<LogType, AnsiPen> _mapLogTypeToPen = {
  LogType.apiCall: AnsiPen()..xterm(010),
};

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
  static void _log(Log log) => debugPrint(log.output);

  static void apiCall(RequestOptions options) =>
      _log(Log.apiCall('[http-request] [${options.method}] ${options.uri}'));

  static void apiResult(Response response) {
    final buffer = StringBuffer();
    final encoder = JsonEncoder.withIndent(' ' * 2);

    buffer.writeln(
        '[http-response] [${response.requestOptions.method}] ${response.requestOptions.uri}');
    buffer.writeln('Status: ${response.statusCode}');
    buffer.writeln('Message: ${response.statusMessage}');
    buffer.write('Data: ${encoder.convert(response.data)}');

    _log(Log.apiResult(buffer.toString()));
  }

  static void m(Object? message) => _log(Log.message('$message'));
  static void s(Object? success) => _log(Log.success('$success'));
  static void w(Object? warning) => _log(Log.warning('$warning'));
  static void e(Object? error) => _log(Log.error('$error'));

  static void exception(Exception e, {required String where}) =>
      _log(Log.exception('[$where], ${e.toString()}'));
  static void dioException(DioException e, {required String where}) =>
      _log(Log.dioException('[$where] ${e.toString()} ${e.response?.data}'));
}
