import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/utils/custom_logger.dart';

abstract class BackendDataSource {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://streetartwitnesses.fvds.ru'),
  );

  static Future<Response?> _makeApiRequest(
    Future<Response> request, {
    required RequestType requestType,
    required String url,
  }) async {
    CustomLogger.showApiCall(url);
    try {
      final result = await request;
      CustomLogger.showApiResult(url, result.toString());
      return result;
    } on DioException catch (e) {
      CustomLogger.showDioException(e, requestType);
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

  static Future<Response?> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }

  static Future<Response?> patch(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.patch(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }

  static Future<Response?> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.delete(
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
