import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

abstract class YandexDiskDataSource {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://cloud-api.yandex.net'),
  );

  static Future<Response?> _makeApiRequest(
    Future<Response> request, {
    required RequestType requestType,
    required String url,
  }) async {
    Logger.apiCall(url);
    try {
      final result = await request;
      Logger.apiResult(url, result.toString());
      return result;
    } on DioException catch (e) {
      Logger.dioError(e, requestType);
      return null;
    }
  }

  static Future<Response?> get(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.get(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }
}
