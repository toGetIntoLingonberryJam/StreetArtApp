import 'dart:async';

import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

abstract class ApiHandler {
  static void _logDioError(DioException e) => Logger.dioException(e);

  static Future<T?> handleApiRequest<T>(
    Future<Response> request, {
    void Function(DioException e)? onDioError,
    T Function(Response r)? onResult,
  }) async {
    assert(T == Response || onResult != null,
        'If <T> is not Response, you should provide the onResult method');

    try {
      final result = await request;
      return onResult != null ? onResult(result) : result as T?;
    } on DioException catch (e) {
      _logDioError(e);
      onDioError?.call(e);
      return null;
    } catch (e) {
      Logger.w('handleApiRequest method error fallback');
      if (e is Exception) Logger.exception(e, where: 'handleApiRequest');
      if (e is Error) Logger.error(e);
      return null;
    }
  }
}

mixin ApiHandlerMixin {
  static void _logDioError(DioException e) => Logger.dioException(e);

  Future<T?> handleApiRequest<T>(
    Future<Response> request, {
    void Function(DioException e)? onDioError,
    T Function(Response r)? onResult,
  }) async {
    assert(T == Response || onResult != null,
        'You should either explicitly set <Response> as T or provide an onResult method');

    try {
      final result = await request;
      return onResult != null ? onResult(result) : result as T?;
    } on DioException catch (e) {
      _logDioError(e);
      onDioError?.call(e);
      return null;
    } catch (e) {
      Logger.w('handleApiRequest method error fallback');
      if (e is Exception) Logger.exception(e, where: 'handleApiRequest');
      if (e is Error) Logger.error(e);
      return null;
    }
  }
}
