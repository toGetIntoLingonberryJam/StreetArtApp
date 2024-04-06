import 'package:dio/dio.dart';

abstract class YaDiskApi {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cloud-api.yandex.net',
      connectTimeout: const Duration(seconds: 8),
    ),
  );
  // )..interceptors.add(LoggerDioInterceptor());

  static Future<Response?> Function(
    String, {
    CancelToken? cancelToken,
    Object? data,
    void Function(int, int)? onReceiveProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) get get => _dio.get;
}
