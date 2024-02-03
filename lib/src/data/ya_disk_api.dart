import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

abstract class YaDiskApi {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://cloud-api.yandex.net'),
  );

  static Future<Response?> _makeApiRequest(
    Future<Response> request, {
    required String url,
  }) async {
    Logger.apiCall(url);
    try {
      final result = await request;
      Logger.apiResult(url, result.toString());
      return result;
    } on DioException catch (e) {
      Logger.dioError(e, where: 'YaDiskApi');
      return null;
    }
  }

  static Future<Response?> get(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _makeApiRequest(
      _dio.get(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      url: url,
    );
  }
}
