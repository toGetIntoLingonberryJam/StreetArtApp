import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/dio_interceptor.dart';

abstract class YaDiskApi {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cloud-api.yandex.net',
      connectTimeout: const Duration(seconds: 8),
    ),
  )..interceptors.add(LoggerDioInterceptor());

  static Dio get dio => _dio;
}
