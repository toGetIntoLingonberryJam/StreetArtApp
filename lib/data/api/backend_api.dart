import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/dio_interceptor.dart';

abstract class BackendApi {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://streetartwitnesses.fvds.ru',
      connectTimeout: const Duration(seconds: 5),
    ),
  )..interceptors.add(LoggerDioInterceptor());

  static Future<Response?> Function(
    String, {
    CancelToken? cancelToken,
    Object? data,
    void Function(int, int)? onReceiveProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) get get => _dio.get;

  static Future<Response?> Function(
    String, {
    CancelToken? cancelToken,
    Object? data,
    void Function(int, int)? onReceiveProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) get post => _dio.post;

  static Future<Response?> Function(
    String, {
    CancelToken? cancelToken,
    Object? data,
    void Function(int, int)? onReceiveProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) get patch => _dio.patch;

  static Future<Response?> Function(
    String, {
    CancelToken? cancelToken,
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) get delete => _dio.delete;
}
