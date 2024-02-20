import 'dart:async';

import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

abstract class ErrorHandler {
  static void _logDioError(DioException e) => Logger.dioException(e, where: 'ErrorHandler');

  static Future<T?> handleApiRequest<T>(
    Future<Response?> request, {
    void Function(DioException e) onDioError = _logDioError,
    T Function(Response? r)? onResult,
  }) async {
    assert(T == Response || onResult != null);

    try {
      final result = await request;
      return onResult != null ? onResult(result) : result as T?;
    } on DioException catch (e) {
      onDioError(e);
      return null;
    }
  }
}
