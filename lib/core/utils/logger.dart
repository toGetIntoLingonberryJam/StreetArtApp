import 'dart:convert';

import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/app_config.dart';

class Log {
  Log({required this.logType, required this.message});

  Log.apiCall(this.message) : logType = LogType.apiCall;
  Log.apiResult(this.message) : logType = LogType.apiResult;
  Log.message(this.message) : logType = LogType.debugMessage;
  Log.success(this.message) : logType = LogType.success;
  Log.warning(this.message) : logType = LogType.warning;
  Log.error(this.message) : logType = LogType.error;
  Log.exception(this.message) : logType = LogType.exception;
  Log.dioException(this.message) : logType = LogType.dioException;
  final LogType logType;
  final String message;

  String get output {
    final pen = AnsiPen()..xterm(logType.xterm);
    return message.split('\n').map((e) => pen.call(e)).join('\n');
  }

  String get debugName => logType.name.toUpperCase();
}

enum LogType {
  apiCall(207),
  apiResult(010),
  debugMessage(011),
  success(082),
  warning(178),
  error(001),
  exception(009),
  dioException(009);

  const LogType(this.xterm);
  final int xterm;
}

abstract class Logger {
  static void _log(Log log) {
    for (final logline in log.output.split('\n')) {
      print(logline);
    }
  }

  static void apiCall(RequestOptions options) {
    if (AppConfig.showApiOutput) {
      final buffer = StringBuffer();
      buffer.write('[http-response] [${options.method}] ${options.uri}');
      if (options.data != null) {
        buffer.writeln();
        buffer.write('Data: ${JsonEncoder.withIndent(' ' * 2).convert(options.data)}');
      }
      _log(Log.apiCall(buffer.toString()));
    } else {
      _log(Log.apiCall('[http-request] [${options.method}] ${options.uri}'));
    }
  }

  static void apiResult(Response response) {
    if (AppConfig.showApiOutput) {
      final buffer = StringBuffer();
      buffer.writeln('[http-response] [${response.requestOptions.method}] [${response.statusCode}] ${response.requestOptions.uri}');
      buffer.writeln('Message: ${response.statusMessage}');
      buffer.write('Data: ${JsonEncoder.withIndent(' ' * 2).convert(response.data)}');
      _log(Log.apiResult(buffer.toString()));
    } else {
      final message = '[http-response] [${response.requestOptions.method}] [${response.statusCode}] ${response.requestOptions.uri}';
      _log(Log.apiResult(message));
    }
  }

  static void d(Object? message) => _log(Log.message('[debug-message] $message'));
  static void s(Object? success) => _log(Log.success('[success] $success'));
  static void w(Object? warning) => _log(Log.warning('[warning] $warning'));

  static void exception(Exception e, {required String where}) => _log(Log.exception('[exception] $e\n[where] $where'));

  static void error(Error e) {
    final trace = e.stackTrace.toString().split('\n').take(5).join('\n');
    _log(Log.error('[dio-exception] $e\n[stacktrace] $trace'));
  }

  static void e(Object e) {
    final trace = StackTrace.current.toString().split('\n').skip(1).take(7).join('\n');
    if (e is DioException) {
      _log(Log.dioException('[dio-exception] $e\n[data] ${e.response?.data}\n[stacktrace] $trace'));
    } else if (e is Exception) {
      _log(Log.exception('[exception] $e\n[stacktrace] $trace'));
    } else if (e is Error) {
      _log(Log.error('[dio-exception] $e\n[stacktrace] $trace'));
    } else {
      _log(Log.warning('[undefined] Logger.e() fallback warning - e is undefined'));
      _log(Log.exception('[undefined] $e\n[stacktrace] $trace'));
    }
  }

  static void dioException(DioException e) {
    final trace = e.stackTrace.toString().split('\n').take(5).join('\n');
    _log(Log.dioException('[dio-exception] $e\n[data] ${e.response?.data}\n[stacktrace] $trace'));
  }
}
